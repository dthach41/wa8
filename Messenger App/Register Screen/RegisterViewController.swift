//
//  RegisterViewController.swift
//  Messenger App
//
//  Created by Derek Thach on 11/4/24.
//

import UIKit

class RegisterViewController: UIViewController {
    
    let registerScreen = RegisterView()
    
    let defaults = UserDefaults.standard
    
    override func loadView() {
        view = registerScreen
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        registerScreen.buttonRegister.addTarget(self, action: #selector(onButtonRegisterClicked), for: .touchUpInside)
    }
    
    func showEmptyFields() {
        let alert = UIAlertController(title: "Error!", message: "Please fill out all the fields", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func showInvalidEmail() {
        let alert = UIAlertController(title: "Error!", message: "Invalid email", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    func showUserAlreadyExists() {
        let alert = UIAlertController(title: "", message: "User already exists", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    @objc func onButtonRegisterClicked() {
        if registerScreen.textFieldName.text! == "" || registerScreen.textFieldPassword.text! == "" {
            showEmptyFields()
        }
        else if !isValidEmail(email: registerScreen.textFieldEmail.text!) {
            showInvalidEmail()
        }
        
        

    }
    

}

