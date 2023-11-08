//
//  UserModel.swift
//  Project
//
//  Created by HAKAN ÖZER on 8.11.2023.
//

import Foundation

// MARK: - UserModel
struct UserModel: Codable {
    let id: Int
    let username, email, firstName, lastName: String
    let gender: String
    let image: String
    let token: String
}
