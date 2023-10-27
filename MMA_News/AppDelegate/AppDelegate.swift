//
//  AppDelegate.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 01.02.2023.
//
import Router
import AppsFlyerLib
import Resolver
import UIKit
import FirestoreSDK
import MindboxSDK
import AddScreen
import Mindbox

@main
final class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    
    // MARK: - public properties
    var window: UIWindow?
    var orientationLock = UIInterfaceOrientationMask.portrait
    
    // MARK: - private properties
    @Injected
    private var advertisingFeature: AdvertisingFeature
    @Injected
    private var userNotificationService: UserNotificationService
    @Injected
    private var routerService : RouterService
    @Injected
    private var mindboxService: SDKMindboxService

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        advertisingFeature.setupFirebase()
        mindboxService.setup()
        setRootVC()
        advertisingFeature.setupAppsFlyer()
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
    
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        // Reports app open from deep link for iOS 10 or later
        AppsFlyerLib.shared().handleOpen(url, options: options)
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        advertisingFeature.startAppsFlyer()
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
