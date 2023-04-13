//
//  User.swift
//  ToDoFIRE
//
//  Created by Victor Kimpel on 13.04.23.
//

import Foundation
import Firebase

struct AppUser {
    
    let uid: String
    let email: String
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email!
    }
}
