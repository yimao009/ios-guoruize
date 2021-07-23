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

    // 单例
    static var instance: AppRouter = {
        AppRouter()
    }()

    private init() { }

    func presentInternalMenu(from viewController: UIViewController?) {
        guard let fromViewController = viewController else { return }

        let viewModel = InternalMenuViewModel(appRouter: self)
        let viewController = InternalMenuViewController(viewModel: viewModel)
        let navigationController = UINavigationController(rootViewController: viewController)
        fromViewController.present(navigationController, animated: true)
    }
}
