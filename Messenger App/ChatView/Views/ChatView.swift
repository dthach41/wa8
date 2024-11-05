//
//  ChatView.swift
//  Messenger App
//
//  Created by Jack Huang on 11/4/24.
//

import UIKit

class ChatView: UIView {

    var tableViewMessages: UITableView!
    var textfieldMessage: UITextField!
    var buttonSend: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setupTableViewMessages()
        setupTextFieldMessage()
        setupButtonSend()
        
        initConstraints()
    }
    
    func setupTableViewMessages() {
        tableViewMessages = UITableView()
        tableViewMessages.register(MessagesTableViewCell.self, forCellReuseIdentifier: Configs.tableViewMessagesID)
        tableViewMessages.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableViewMessages)
    }
    
    func setupTextFieldMessage() {
        textfieldMessage = UITextField()
        textfieldMessage.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textfieldMessage)
    }
    
    func setupButtonSend() {
        buttonSend = UIButton(type: .system)
        buttonSend.setImage(UIImage(systemName: "paperplane.fill"), for: .normal)
        buttonSend.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonSend)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            textfieldMessage.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            textfieldMessage.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            textfieldMessage.trailingAnchor.constraint(lessThanOrEqualTo: buttonSend.leadingAnchor, constant: -5),
            
            buttonSend.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            buttonSend.leadingAnchor.constraint(lessThanOrEqualTo: textfieldMessage.trailingAnchor, constant: 5),
            buttonSend.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: -10),
            
            tableViewMessages.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            tableViewMessages.bottomAnchor.constraint(equalTo: textfieldMessage.topAnchor, constant: -10),
            tableViewMessages.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            tableViewMessages.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -10),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
