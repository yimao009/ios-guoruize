//
//  AppRouter.swift
//  Moments
//
//  Created by guoruize on 2021/7/23.
//

import UIKit

protocol AppRouting {
    func presentInternalMenu(from viewController: UIViewController?)
}

struct AppRouter: AppRouting {
    func presentInternalMenu(from viewController: UIViewController?) {
        guard let fromViewController = viewController else { return }

        let viewController = InternalMenuViewController()
        let router = InternalMenuRouter(fromController: viewController)
        let viewModel = InternalMenuViewModel(appRouter: router)
        viewController.viewModel = viewModel
        let navigationController = UINavigationController(rootViewController: viewController)
        fromViewController.present(navigationController, animated: true)
    }
}
