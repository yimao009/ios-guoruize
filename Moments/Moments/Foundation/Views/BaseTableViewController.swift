//
//  BaseTableViewController.swift
//  Moments
//
//  Created by guoruize on 2021/7/27.
//

import UIKit
import DesignKit
import RxSwift
import RxDataSources

class BaseTableViewController: BaseViewController {
    var viewModel: ListViewModel!

    private let tableView: UITableView = configure(.init()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.separatorStyle = .none
        $0.rowHeight = UITableView.automaticDimension
        $0.estimatedRowHeight = 100
        $0.contentInsetAdjustmentBehavior = .never
    }

    private let activityIndicatorView: UIActivityIndicatorView = configure(.init(style: .large)) {
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

        loadItems()
    }
}
private extension BaseTableViewController {
    func setupUI() {
        view.backgroundColor = UIColor.designKit.background
        tableView.backgroundColor = UIColor.designKit.background

        [
            UserProfileListItemViewModel.reuseIdentifier: BaseTableViewCell<UserProfileListItemView>.self,
            MomentListItemViewModel.reuseIdentifier: BaseTableViewCell<MomentListItemView>.self
        ].forEach {
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
            .bind { [weak self] _ in self?.loadItems() }
            .disposed(by: disposeBag)

        tableView.refreshControl = refreshControl

        let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, ListItemViewModel>>(configureCell: { _, tableView, indexPath, item in
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: type(of: item)), for: indexPath)
            (cell as? ListItemCell)?.update(with: item)
            return cell
        })

        viewModel.listItems
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)

        viewModel.loadItems()
            .do(onDispose: { self.activityIndicatorView.rx.isAnimating.onNext(false) })
            .map { false }
            .startWith(true)
            .distinctUntilChanged()
            .bind(to: activityIndicatorView.rx.isAnimating)
            .disposed(by: disposeBag)
    }

    func loadItems() {
        viewModel.loadItems()
            .do(onDispose: { [weak self] in
                self?.activityIndicatorView.rx.isAnimating.onNext(false)
                self?.tableView.refreshControl?.endRefreshing()
            })
            .map { false }
            .startWith(true)
            .distinctUntilChanged()
            .bind(to: activityIndicatorView.rx.isAnimating)
            .disposed(by: disposeBag)
    }
}
