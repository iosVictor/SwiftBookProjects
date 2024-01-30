//
//  AppDelegate.swift
//  Notifications
//
//  Created by Victor Kimpel on 30.11.2023.
//  Copyright © 2023 Victor Kimpel. All rights reserved.
//

import UIKit
import UserNotifications
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let notifications = Notifications()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        notifications.requestAutorization()
        notifications.notificationCenter.delegate = notifications
        
        FirebaseApp.configure()
        
        notifications.messagingDelegate.delegate = (notifications as! any MessagingDelegate)
        
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        UIApplication.shared.applicationIconBadgeNumber = 0
    }
    
    func application(
        _ application: UIApplication,
        didRegisterForRemoteNotificationsWithDeviceToken
        deviceToken: Data) {
            
            let tokenParts = deviceToken.map { data -> String in
                return String(format: "%02.2hhx", data)
            }
            
            let token = tokenParts.joined()
            print("Device token: \(token)")
    }
    
    func application(
        _ application: UIApplication,
        didFailToRegisterForRemoteNotificationsWithError
        error: Error) {
        
            print("Failed to register: \(error)")
    }
    
    func openSettings() {
        let storyboard = UIStoryboard(name: "Settings", bundle: nil)
        let settings = storyboard.instantiateViewController(withIdentifier: "Settings")
        window?.rootViewController = settings
    }
}



