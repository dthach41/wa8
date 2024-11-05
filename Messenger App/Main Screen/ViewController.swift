//
//  ViewController.swift
//  Messenger App
//
//  Created by Derek Thach on 11/4/24.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    
    let mainScreen = MainScreenView()
    
    var handleAuth: AuthStateDidChangeListenerHandle?
    var currentUser:FirebaseAuth.User?
    
    override func loadView() {
        view = mainScreen
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //MARK: handling if the Authentication state is changed (sign in, sign out, register)...
        handleAuth = Auth.auth().addStateDidChangeListener{ auth, user in
            if user == nil{
                //MARK: not signed in...
                let loginViewController = LoginViewController()
                self.navigationController?.pushViewController(loginViewController, animated: true)
                
            }else{
                //MARK: the user is signed in...
                self.view = self.mainScreen
                self.currentUser = user
                self.mainScreen.buttonLogout.addTarget(self, action: #selector(self.onSignOutClicked), for: .touchUpInside)
                self.mainScreen.buttonNewMessage.addTarget(self, action: #selector(self.onNewMessageButtonClicked), for: .touchUpInside)
            }
        }
    }
    
    
    
    @objc func onSignOutClicked() {
        let logoutAlert = UIAlertController(title: "Logging out!", message: "Are you sure want to log out?", preferredStyle: .actionSheet)
        logoutAlert.addAction(UIAlertAction(title: "Yes, log out!", style: .default, handler: {(_) in
                do{
                    try Auth.auth().signOut()
                }catch{
                    print("Error occured!")
                }
            })
        )
        logoutAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        self.present(logoutAlert, animated: true)
    }
    
    
    @objc func onNewMessageButtonClicked() {
        let newMessageViewController = NewMessageViewController()
        newMessageViewController.currentUser = self.currentUser
        navigationController?.pushViewController(newMessageViewController, animated: true)
    }


}

