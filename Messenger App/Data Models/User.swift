//
//  User.swift
//  Messenger App
//
//  Created by Derek Thach on 11/5/24.
//

import Foundation
import FirebaseFirestore

struct User: Codable {
    @DocumentID var id: String?
    var displayName: String
    var email: String
    var uid: String
    
    init(displayName: String, email: String, uid: String) {
        self.displayName = displayName
        self.email = email
        self.uid = uid
    }
}
