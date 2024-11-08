//
//  User.swift
//  Messenger App
//
//  Created by Derek Thach on 11/5/24.
//

import Foundation
import FirebaseFirestore

struct User: Codable {
    @DocumentID var uid: String?
    var displayName: String
    var email: String
    
    init(displayName: String, email: String) {
        self.displayName = displayName
        self.email = email
    }
}
