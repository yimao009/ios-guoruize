//
//  InternalMenuViewController.swift
//  Moments
//
//  Created by guoruize on 2021/7/23.
//

import UIKit
import RxDataSources
import SnapKit

final class InternalMenuViewController: BaseViewController {
    var viewModel: InternalMenuViewModelType!

    lazy var tableView: UITableView = configure(UITableView(frame: .zero, style: .grouped)) {
        $0.rowHeight = UITableView.automaticDimension
        $0.estimatedRowHeight = 44

        $0.register(InternalMenuDescriptionCell.self, forCellReuseIdentifier: InternalMenuItemType.description.rawValue)
        $0.register(InternalMenuActionTriggerCell.self, forCellReuseIdentifier: InternalMenuItemType.actionTrigger.rawValue)
        $0.register(InternalMenuFeatureToggleCell.self, forCellReuseIdentifier: InternalMenuItemType.featureToggle.rawValue)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()
        setupConstraints()
        DispatchQueue.main.async {
            self.setupBindings()
        }
    }
}

private extension InternalMenuViewController {
    func setupLayout() {
        title = viewModel.title
        view.addSubview(tableView)

    }

    func setupConstraints() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    func setupBindings() {
        let dismissBarButtonItem: UIBarButtonItem = UIBarButtonItem(systemItem: .done)
        dismissBarButtonItem.rx.tap.subscribe(onNext:{[weak self] in
            self?.dismiss(animated: true, completion: nil)
        }).disposed(by: disposeBag)
        navigationItem.rightBarButtonItem = dismissBarButtonItem

        let dataSource = RxTableViewSectionedReloadDataSource<InternalMenuSection>(
            configureCell: { dataSource, tableView, indexPath, item in
            let cell = tableView.dequeueReusableCell(withIdentifier: item.type.rawValue, for: indexPath)
            if let cell = cell as? InternalMenuItemViewing {
                cell.update(with: item)
            }
            return cell
            }, titleForHeaderInSection: { dataSource, section in
            return dataSource.sectionModels[section].title
            }, titleForFooterInSection: { dataSource, section in
            return dataSource.sectionModels[section].footer
            })

        viewModel.sections
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)

        tableView.rx
            .itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                self?.tableView.deselectRow(at: indexPath, animated: true)
            })
            .disposed(by: disposeBag)

        tableView.rx
            .modelSelected(InternalMenuItemViewModel.self)
            .subscribe(onNext: { item in
                item.select()
            })
            .disposed(by: disposeBag)
    }
}
