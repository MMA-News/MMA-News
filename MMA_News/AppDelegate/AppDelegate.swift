//
//  AppDelegate.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 01.02.2023.
//
import Router
import Resolver
import UIKit
import FirestoreSDK
import Firebase

@main
final class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    
    // MARK: - public properties
    var window: UIWindow?
    var orientationLock = UIInterfaceOrientationMask.portrait
    
    @Injected
    private var routerService : RouterService

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		FirebaseApp.configure()
        setRootVC()
        return true
    }
    
    private func setRootVC(){
        let builder = LoadingScreenViewControllerBuilder.build()
        builder.viewManager.state = .createViewProperties
        routerService.setRootViewController(
            window: &window,
            viewController: builder.view
        )
    }
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return self.orientationLock
    }
}
