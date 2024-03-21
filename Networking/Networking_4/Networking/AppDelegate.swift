//
//  AppDelegate.swift
//  Networking
//
//  Created by Victor Kimpel on 21.03.2024.
//  Copyright © 2024 Victor Kimpel. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var bgSessionCompletionHandler: (() -> ())?

    func application(_ application: UIApplication, handleEventsForBackgroundURLSession identifier: String, completionHandler: @escaping () -> Void) {
        
        bgSessionCompletionHandler = completionHandler
    }
}

