//
//  User.swift
//  CareAndCure
//
//  Created by Mohamed M3aty on 6/22/20.
//  Copyright © 2020 Mohamed M3aty. All rights reserved.
//

import Foundation


// MARK: - Signup
struct Signup: Codable {
    let message: String?
    let status: Int?
    let token: String?
    let username: String?
    let email: String?
    let phone: String?
    let address: String?
    
}


// MARK: - Login
struct LoginUser: Codable {
    let status: Int?
    let token: String?
    let userID: Int?
    let username: String?
    let email: String?
    let adress, phone: String?

    enum CodingKeys: String, CodingKey {
        case status, token
        case userID = "user_id"
        case username = "user_name"
        case email, adress, phone
    }
}
