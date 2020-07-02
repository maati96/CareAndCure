//
//  UserDefault.swift
//  CareAndCure
//
//  Created by Mohamed M3aty on 6/27/20.
//  Copyright © 2020 Mohamed M3aty. All rights reserved.
//

import Foundation


struct UserDefault {
    
    static var instance = UserDefault()
       // User Defaults
     let defaults = UserDefaults.standard
       var isLoggedIn: Bool {
           get {
               return defaults.bool(forKey: LOGGED_IN_KEY)
           }
           set {
               defaults.set(newValue, forKey: LOGGED_IN_KEY)
           }
       }
       
       var authToken: String {
           get {
               return defaults.value(forKey: TOKEN_KEY) as! String
           }
           set {
               defaults.set(newValue, forKey: TOKEN_KEY)
               defaults.synchronize()

           }
       }
       
       var userName: String {
           get {
             return defaults.value(forKey: USER_NAME) as! String
           }
           set {
               defaults.set(newValue, forKey: USER_NAME)
               defaults.synchronize()
           }
         
       }
}
