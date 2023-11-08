//
//  Util.swift
//  Project
//
//  Created by HAKAN ÖZER on 8.11.2023.
//

import Foundation

class Util {
    
    static func userStore( data: UserModel ) {
        if let jsonUserModel = try? JSONEncoder().encode(data) {
            UserDefaults.standard.setValue(jsonUserModel, forKey: "user")
            UserDefaults.standard.synchronize()
        }
    }
    
    static func userData() -> UserModel? {
        if let dtUser = UserDefaults.standard.object(forKey: "user") as? Data {
            UserDefaults.standard.synchronize()
            if  let userModel = try? JSONDecoder().decode(UserModel.self, from: dtUser) {
                return userModel
            }else {
                return nil
            }
        }
        return nil
    }
    
    
}
