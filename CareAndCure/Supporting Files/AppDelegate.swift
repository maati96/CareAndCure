//
//  AppDelegate.swift
//  CareAndCure
//
//  Created by Mohamed M3aty on 3/6/20.
//  Copyright © 2020 Mohamed M3aty. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.main.bounds)
        IQKeyboardManager.shared.enable = true

        if UserDefault.instance.isLoggedIn {
            print("is loggedIn Value: ",UserDefault.instance.isLoggedIn)
            let tabbarVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "tabbarVC")
            window?.rootViewController = tabbarVC
            window?.makeKeyAndVisible()

        } else {
            let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "loginVC")
            window?.rootViewController = loginVC
            window?.makeKeyAndVisible()
        }
        
        return true
    }



}

