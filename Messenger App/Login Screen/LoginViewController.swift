//
//  LoginViewController.swift
//  Messenger App
//
//  Created by Derek Thach on 11/4/24.
//

import UIKit

import FirebaseAuth

class LoginViewController: UIViewController {
    let loginScreen = LoginView()
    
    override func loadView() {
        view = loginScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true

        loginScreen.buttonLogin.addTarget(self, action: #selector(onButtonLoginClicked), for: .touchUpInside)
        loginScreen.buttonRegister.addTarget(self, action: #selector(onButtonRegisterClicked), for: .touchUpInside)
        
    
    }
    
    func showUserNotFound() {
        let alert = UIAlertController(title: "", message: "User not found", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    func showIncorrectPassword() {
        let alert = UIAlertController(title: "", message: "Password is incorrect", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    
    @objc func onButtonLoginClicked() {
        let email = loginScreen.textFieldEmail.text!
        let password = loginScreen.textFieldPassword.text!
        //MARK: authenticating the user...
        Auth.auth().signIn(withEmail: email, password: password, completion: {(result, error) in
            if error == nil{
                //MARK: user authenticated...
                self.navigationController?.popViewController(animated: true)
                print("sucess")
            }else{
                //MARK: alert that no user found or password wrong...
            }
        })
    }
    
    @objc func onButtonRegisterClicked() {
        let registerViewController = RegisterViewController()
        navigationController?.pushViewController(registerViewController, animated: true)
    }
    

}

