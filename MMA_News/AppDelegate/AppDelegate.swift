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
import MindboxSDK
import Mindbox

@main
final class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    
    // MARK: - public properties
    var window: UIWindow?
    var orientationLock = UIInterfaceOrientationMask.portrait
    
    @Injected
    private var userNotificationService: UserNotificationService
    @Injected
    private var routerService : RouterService
    @Injected
    private var mindboxService: SDKMindboxService

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		FirebaseApp.configure()
        mindboxService.setup()
        setRootVC()
        userNotificationService.setup(
            application: application,
            completionHandler:  { _ in }
        )
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
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let deviceTokenString = deviceToken.reduce("", {$0 + String(format: "%02X", $1)})
        mindboxService.deviceToken = deviceTokenString
        Mindbox.shared.apnsTokenUpdate(deviceToken: deviceToken)
    }
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return self.orientationLock
    }
}
