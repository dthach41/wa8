//
//  MainScreenView.swift
//  Messenger App
//
//  Created by Derek Thach on 11/4/24.
//


import UIKit

class MainScreenView: UIView {
    var buttonLogout: UIButton!
    var buttonNewMessage: UIButton!
    var tableViewChatRooms: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupButtonLogout()
        setupButtonNewMessage()
        setupTableViewChatRooms()
        
        initConstraints()
    }
    
    func setupButtonLogout() {
        buttonLogout = UIButton(type: .system)
        buttonLogout.setImage(UIImage(systemName: "rectangle.portrait.and.arrow.right"), for: .normal)
        buttonLogout.contentHorizontalAlignment = .fill
        buttonLogout.contentVerticalAlignment = .fill
        buttonLogout.imageView?.contentMode = .scaleAspectFit
        buttonLogout.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonLogout)
    }
    
    func setupButtonNewMessage() {
        buttonNewMessage = UIButton(type: .system)
        buttonNewMessage.setImage(UIImage(systemName: "bubble"), for: .normal)
        buttonNewMessage.contentHorizontalAlignment = .fill
        buttonNewMessage.contentVerticalAlignment = .fill
        buttonNewMessage.imageView?.contentMode = .scaleAspectFit
        buttonNewMessage.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonNewMessage)
    }
    
    func setupTableViewChatRooms() {
        tableViewChatRooms = UITableView()
        tableViewChatRooms.register(ChatTableViewCell.self, forCellReuseIdentifier: Configs.tableViewChatsID)
        tableViewChatRooms.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableViewChatRooms)
    }
        
    func initConstraints() {
        NSLayoutConstraint.activate([
            buttonLogout.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            buttonLogout.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            
            buttonNewMessage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            buttonNewMessage.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            
            tableViewChatRooms.topAnchor.constraint(equalTo: buttonLogout.bottomAnchor, constant: 10),
            tableViewChatRooms.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            tableViewChatRooms.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            tableViewChatRooms.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
