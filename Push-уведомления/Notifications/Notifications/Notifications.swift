//
//  Notifications.swift
//  Notifications
//
//  Created by Victor Kimpel on 5.12.23.
//  Copyright © 2023 Victor Kimpel. All rights reserved.
//

import UIKit
import UserNotifications
import Firebase

class Notifications: NSObject, UNUserNotificationCenterDelegate {
    
    let notificationCenter = UNUserNotificationCenter.current()
    let messagingDelegate = Messaging.messaging()

    func requestAutorization() {
        notificationCenter.requestAuthorization(options: [.alert, .sound, .badge, .providesAppNotificationSettings, .provisional]) { granted, error in
            print("Permission granted: \(granted)")
            
            guard granted else { return }
            self.getNotificationSettings()
        }
    }
    
    func getNotificationSettings() {
        notificationCenter.getNotificationSettings { settings in
            print("Notification settings: \(settings)")
            
            guard settings.authorizationStatus == .authorized else { return }
            
            DispatchQueue.main.async {
                UIApplication.shared.registerForRemoteNotifications()
            }
        }
    }
    
    func scheduleNotification(notificationType: String) {
        
        let content = UNMutableNotificationContent()
        let userAction = "User Action"
        
        content.title = notificationType
        content.body = "Summer Time"
        content.sound = UNNotificationSound.default
        content.badge = 1
        content.categoryIdentifier = userAction
        
        content.threadIdentifier = notificationType
        
        content.summaryArgumentCount = 10
        content.summaryArgument = notificationType
        
        /*
        guard let path = Bundle.main.path(forResource: "favicon", ofType: "png") else { return }
        
        let url = URL(fileURLWithPath: path)
        
        do {
            let attachment = try UNNotificationAttachment(
                identifier: "favicon",
                url: url,
                options: nil)
            
            content.attachments = [attachment]
        } catch {
            print("The attachment cold not be loaded")
        }
         */
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        
        let identifire = UUID().uuidString
        let request = UNNotificationRequest(identifier: identifire,
                                            content: content,
                                            trigger: trigger)
        
        notificationCenter.add(request) { error in
            if let error = error {
                print("Error \(error.localizedDescription)")
            }
        }
        
        /*
        let snoozeAction = UNNotificationAction(identifier: "Snooze", title: "Snooze", options: [])
        let deleteAction = UNNotificationAction(identifier: "Delete", title: "Delete", options: [.destructive])
        let category = UNNotificationCategory(
            identifier: userAction,
            actions: [snoozeAction, deleteAction],
            intentIdentifiers: [],
            options: [])
        
        notificationCenter.setNotificationCategories([category])
         */
    }
    
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
            
            completionHandler([.alert, .sound])
        }
    
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        didReceive response: UNNotificationResponse,
        withCompletionHandler completionHandler: @escaping () -> Void) {
            
            if response.notification.request.identifier == "Local Notification" {
                print("Handling notification with the Local Notification Identifire")
            }
            
            switch response.actionIdentifier {
            case UNNotificationDismissActionIdentifier:
                print("Dismiss Action")
            case UNNotificationDefaultActionIdentifier:
                print("Default")
            case "Snooze":
                print("Snooze")
                scheduleNotification(notificationType: "Reminder")
            case "Delete":
                print("Delete")
            default:
                print("Unknown action")
            }
            
            completionHandler()
        }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, openSettingsFor notification: UNNotification?) {
        
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        appDelegate?.openSettings()
    }
}

//extension Notifications: MessagingDelegate {
//    
//    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
//        print("\nFirebase registration token: \(fcmToken)\n")
//    }
//}
