//
//  Chat.swift
//  Messenger App
//
//  Created by Jack Huang on 11/4/24.
//

import Foundation
import FirebaseFirestore

struct Chat: Codable {
    @DocumentID var id: String?
    var participants: [String]
    var lastMessage: String
    var lastMessageTime: Date
    
    init(participants: [String], lastMessage: String, lastMessageTime: Date) {
        self.participants = participants
        self.lastMessage = lastMessage
        self.lastMessageTime = lastMessageTime
    }
}
