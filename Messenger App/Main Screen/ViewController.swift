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
    
    
    override func viewDidAppear(_ animinated: Bool) {
        
        super.viewDidAppear(animinated)
        
        //MARK: handling if the Authentication state is changed (sign in, sign out, register)...
        handleAuth = Auth.auth().addStateDidChangeListener{ auth, user in
            if user == nil{
                //MARK: not signed in...
                let loginViewController = LoginViewController()
                self.navigationController?.pushViewController(loginViewController, animated: true)
                
            }else{
                //MARK: the user is signed in...
                self.view = self.mainScreen
                
            }
        }
    }


}

