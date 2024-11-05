//
//  NewMessageView.swift
//  Messenger App
//
//  Created by Derek Thach on 11/5/24.
//


import UIKit

class NewMessageView: UIView {
    var labelTo: UILabel!
    var textFieldEmail: UITextField!
    var textViewMessage: UITextView!
    var buttonSend: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        setupTextFieldNotes()
        setupLabelTo()
        setupTextFieldEmail()
        setupButtonSend()
        
        initConstraints()
    }
    
    func setupLabelTo() {
        labelTo = UILabel()
        labelTo.text = "To: "
        labelTo.font = .boldSystemFont(ofSize: 14)
        labelTo.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelTo)
    }
    
    func setupTextFieldEmail() {
        textFieldEmail = UITextField()
        textFieldEmail.borderStyle = .roundedRect
        textFieldEmail.layer.borderWidth = 1
        textFieldEmail.autocapitalizationType = .none
        textFieldEmail.textAlignment = .center
        textFieldEmail.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldEmail)
    }
    
    func setupTextFieldNotes() {
        textViewMessage = UITextView()
        textViewMessage.layer.borderColor = UIColor.gray.cgColor
        textViewMessage.font = UIFont.systemFont(ofSize: 16)
        textViewMessage.layer.borderWidth = 1
        textViewMessage.layer.cornerRadius = 5
        textViewMessage.autocapitalizationType = .none
        textViewMessage.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textViewMessage)
    }
    
    func setupButtonSend() {
        buttonSend = UIButton(type: .system)
        buttonSend.setTitle("Send", for: .normal)
        buttonSend.setTitleColor(.white, for: .normal)
        buttonSend.backgroundColor = .gray
        buttonSend.layer.borderWidth = 1
        buttonSend.layer.cornerRadius = 10
        buttonSend.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonSend)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            labelTo.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            labelTo.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            
            textFieldEmail.leadingAnchor.constraint(equalTo: labelTo.trailingAnchor, constant: 16),
            textFieldEmail.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            textFieldEmail.centerYAnchor.constraint(equalTo: labelTo.centerYAnchor),
            textFieldEmail.widthAnchor.constraint(lessThanOrEqualToConstant: 1000),
            
            textViewMessage.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 32),
            textViewMessage.bottomAnchor.constraint(equalTo: buttonSend.topAnchor, constant: -32),
            textViewMessage.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            textViewMessage.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            
            buttonSend.topAnchor.constraint(equalTo: textViewMessage.bottomAnchor, constant: 32),
            buttonSend.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -32),
            buttonSend.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 120),
            buttonSend.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -120),
            buttonSend.heightAnchor.constraint(equalToConstant: 40),
            buttonSend.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

