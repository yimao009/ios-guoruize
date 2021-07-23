//
//  AppRouter.swift
//  Moments
//
//  Created by guoruize on 2021/7/23.
//

import UIKit

enum NavigationAction {
    case present, push
}

protocol AppRouting {

    /// 导航道调试菜单，【只有开发和测试环境可以看到】
    /// - Parameters:
    ///   - action: 打开方法 push或者present
    ///   - from: 从那个VC打开
    func routeToInternalMenu(_ action: NavigationAction, from: UIViewController?)
}

struct AppRouter: AppRouting {

    // 单例
    static var instance: AppRouter = {
        AppRouter()
    }()

    private init() { }

    func routeToInternalMenu(_ action: NavigationAction, from: UIViewController?) {
        guard let rootViewController = rootViewController else { return }
        let viewModel = InternalMenuViewModel(appRouter: self)
        let viewController = InternalMenuViewController(viewModel: viewModel)
        let navigationController = UINavigationController(rootViewController: viewController)
        rootViewController.present(navigationController, animated: true)
    }
}
