//
//  NotificationService.swift
//  MindboxNotificationServiceExtension
//
//  Created by IOS Developer on 30.03.2023.
//
import MindboxNotifications
import UserNotifications

class NotificationService: UNNotificationServiceExtension {
    
    lazy var mindboxService = MindboxNotificationService()
    
    override func didReceive(
        _ request: UNNotificationRequest,
        withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void
    ) {
        mindboxService.didReceive(request, withContentHandler: contentHandler)
    }
    
    override func serviceExtensionTimeWillExpire() {
        mindboxService.serviceExtensionTimeWillExpire()
    }
}
