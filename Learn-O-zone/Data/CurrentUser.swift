//
//  CurrentUser.swift
//  Learn-O-zone
//
//  Created by Hasan Qasim on 16/5/20.
//  Copyright © 2020 Hasan Qasim. All rights reserved.
//

import UIKit

class CurrentUser {
    static var currentUser: User?
    static var state = false
    static var funFactIsActive = false
    
    static func getCurrentUser() -> User {
        return currentUser!
    }
    
    static func setCurrentUser(user: User) {
        currentUser = user
    }
    
    static func getState() -> Bool {
        return state
    }
    
    static func setState(_ flag: Bool) {
        state = flag
    }
    
    static func getFunFactIsActive() -> Bool {
        return funFactIsActive
    }
    
    static func setFunFactIsActive(_ status: Bool) {
        funFactIsActive = status
    }
}
