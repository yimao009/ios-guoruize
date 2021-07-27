//
//  MomentsListViewController.swift
//  Moments
//
//  Created by guoruize on 2021/7/26.
//

import UIKit
import DesignKit
import RxSwift
import RxDataSources

class MomentsListViewController: BaseViewController {
    private var viewModel: MomentsListViewModel!

    private let tableView: UITableView = configure(.init()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.separatorStyle = .none
        $0.rowHeight = UITableView.automaticDimension
        $0.estimatedRowHeight = 100
        $0.contentInsetAdjustmentBehavior = .never
    }

    private let activityIndicatorView: UIActivityIndicatorView = configure(.init()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    private let errorLabel: UILabel = configure(.init()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.isHidden = true
        $0.textColor = UIColor.designKit.primaryText
        $0.text = L10n.MomentsList.errorMessage
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupConstraints()
        DispatchQueue.main.async {
            // Walkaround for a warning
            // https://github.com/RxSwiftCommunity/RxDataSources/issues/331
            self.setupBindings()
        }
    }

    override init() {
        // The `userID` is hardcoded for now
        viewModel = MomentsListViewModel(userID: "1", momentsRepo: MomentsRepo.shared)
        super.init()
    }
}

private extension MomentsListViewController {
    func setupUI() {
        let cells = [
            UserProfileListItemViewModel.reuseIdentifier : BaseTableViewCell<UserProfileListItemView>.self
        ]

        cells.forEach {
            tableView.register($0.value, forCellReuseIdentifier: $0.key)
        }

        [tableView, activityIndicatorView, errorLabel].forEach {
            view.addSubview($0)
        }
    }

    func setupConstraints() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        activityIndicatorView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(60)
            $0.height.equalTo(60)
        }

        errorLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }

    func setupBindings() {
        let refreshControl = UIRefreshControl()
        refreshControl.rx.controlEvent(.valueChanged)
            .map { refreshControl.isRefreshing }
            .filter { $0 }
            .bind { [weak self] _ in _ = self?.viewModel.load() }
            .disposed(by: disposeBag)

        tableView.refreshControl = refreshControl

        let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, ListItemViewModel>> { _, tableView, indexPath, item in
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: type(of: item)), for: indexPath)
            if let cell = cell as? BaseTableViewCell<UserProfileListItemView>, let item = item as? UserProfileListItemViewModel {
                cell.update(with: item)
            }
            return cell
        }

        viewModel.listItems.bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)

        viewModel.load()
            .do(onDispose: { self.activityIndicatorView.rx.isAnimating.onNext(false) })
            .map { false }
            .startWith(true)
            .distinctUntilChanged()
            .bind(to: activityIndicatorView.rx.isAnimating)
            .disposed(by: disposeBag)
    }
}
