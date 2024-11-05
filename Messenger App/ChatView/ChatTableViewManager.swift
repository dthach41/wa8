//
//  ChatTableViewManager.swift
//  Messenger App
//
//  Created by Jack Huang on 11/4/24.
//

import Foundation
import UIKit

extension ChatViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Configs.tableViewMessagesID, for: indexPath) as! MessagesTableViewCell
        
        let message = messages[indexPath.row]
        cell.labelName.text = message.name
        cell.labelText.text = message.text
        cell.labelDateTime.text = DateFormatter.localizedString(from: message.sentAt, dateStyle: .none, timeStyle: .short)
        
        cell.isCurrentUserMessage = message.uid == currentUser.uid
        
        return cell
    }
}
