//
//  NotificationViewController.swift
//  MindboxNotificationContentExtension
//
//  Created by IOS Developer on 30.03.2023.
//

import UIKit
import UserNotifications
import UserNotificationsUI
import MindboxNotifications

class NotificationViewController: UIViewController, UNNotificationContentExtension {
    
    lazy var mindboxService = MindboxNotificationService()
    
    func didReceive(_ notification: UNNotification) {
        mindboxService.didReceive(
            notification: notification,
            viewController: self,
            extensionContext: extensionContext
        )
    }
}
