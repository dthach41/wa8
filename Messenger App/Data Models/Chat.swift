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
    var messages: [Message]
    
    init(participants: [String], lastMessage: String, lastMessageTime: Date, messages: [Message]) {
        self.participants = participants
        self.lastMessage = lastMessage
        self.lastMessageTime = lastMessageTime
        self.messages = messages
    }
}
