//
//  AppDelegate.swift
//  Moments
//
//  Created by guoruize on 2021/7/22.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        onLaunch()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication,
                     configurationForConnecting connectingSceneSession: UISceneSession,
                     options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: L10n.Development.defaultConfiguration, sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running,
        // this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}

private extension AppDelegate {
    func onLaunch() {
        FirebaseApp.configure()

        // Can register multiple tracking providers here
        [FirebaseTrackingProvider()].forEach {
            TrackingRepo.shared.register(trackingProvider: $0)
        }
    }
}

#if DEBUG || INTERNAL
extension UIWindow {
    open override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        let appRoute: AppRouting = AppRouter()
        if motion == .motionShake {
            appRoute.presentInternalMenu(from: rootViewController)
        }
    }
}
#endif
