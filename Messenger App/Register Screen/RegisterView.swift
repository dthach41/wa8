//
//  RegisterView.swift
//  Messenger App
//
//  Created by Derek Thach on 11/4/24.
//

import UIKit

class RegisterView: UIView {
    
    var labelRegister: UILabel!
    var labelName: UILabel!
    var textFieldName: UITextField!
    var labelEmail: UILabel!
    var textFieldEmail: UITextField!
    var labelPassword: UILabel!
    var textFieldPassword: UITextField!
    var buttonRegister: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white

        setupLabelRegister()
        setupLabelName()
        setupTextFieldName()
        setupLabelEmail()
        setupTextFieldEmail()
        setupLabelPassword()
        setupTextFieldPassword()
        setupButtonRegister()
        
        initConstraints()
    }
    

    
    func setupLabelRegister() {
        labelRegister = UILabel()
        labelRegister.text = "Register"
        labelRegister.font = .boldSystemFont(ofSize: 36)
        labelRegister.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelRegister)
    }
    
    func setupLabelName() {
        labelName = UILabel()
        labelName.text = "Name"
        labelName.font = .systemFont(ofSize: 24)
        labelName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelName)
    }
    
    func setupTextFieldName() {
        textFieldName = UITextField()
        textFieldName.borderStyle = .roundedRect
        textFieldName.layer.borderWidth = 1
        textFieldName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldName)
    }
    
    func setupLabelEmail() {
        labelEmail = UILabel()
        labelEmail.text = "Email:"
        labelEmail.font = .systemFont(ofSize: 24)
        labelEmail.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelEmail)
    }
    
    func setupTextFieldEmail() {
        textFieldEmail = UITextField()
        textFieldEmail.borderStyle = .roundedRect
        textFieldEmail.layer.borderWidth = 1
        textFieldEmail.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldEmail)
    }
    
    func setupLabelPassword() {
        labelPassword = UILabel()
        labelPassword.text = "Password:"
        labelPassword.font = .systemFont(ofSize: 24)
        labelPassword.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelPassword)
    }
    
    func setupTextFieldPassword() {
        textFieldPassword = UITextField()
        textFieldPassword.borderStyle = .roundedRect
        textFieldPassword.layer.borderWidth = 1
        textFieldPassword.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldPassword)
    }

    
    func setupButtonRegister() {
        buttonRegister = UIButton(type: .system)
        buttonRegister.setTitle("Register", for: .normal)
        buttonRegister.setTitleColor(.white, for: .normal)
        buttonRegister.backgroundColor = .gray
        buttonRegister.layer.borderWidth = 1
        buttonRegister.layer.cornerRadius = 10
        buttonRegister.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonRegister)
    }
    

    func initConstraints() {
        NSLayoutConstraint.activate([
            
            labelRegister.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            labelRegister.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            labelName.topAnchor.constraint(equalTo: labelRegister.bottomAnchor, constant: 24),
            labelName.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            textFieldName.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 16),
            textFieldName.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldName.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 48),
            textFieldName.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -48),
            
            labelEmail.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: 24),
            labelEmail.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            textFieldEmail.topAnchor.constraint(equalTo: labelEmail.bottomAnchor, constant: 16),
            textFieldEmail.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldEmail.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 48),
            textFieldEmail.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -48),
            
            labelPassword.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 24),
            labelPassword.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            textFieldPassword.topAnchor.constraint(equalTo: labelPassword.bottomAnchor, constant: 16),
            textFieldPassword.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldPassword.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 48),
            textFieldPassword.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -48),
            
            buttonRegister.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor, constant: 24),
            buttonRegister.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 120),
            buttonRegister.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -120),
            buttonRegister.heightAnchor.constraint(equalToConstant: 40),
            
            
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

