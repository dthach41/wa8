//
//  RegisterViewController.swift
//  Messenger App
//
//  Created by Derek Thach on 11/4/24.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore


class RegisterViewController: UIViewController {
    
    let registerScreen = RegisterView()
    
    let database = Firestore.firestore()
    
    let childProgressView = ProgressSpinnerViewController()
    
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
    
    func showPasswordNotMatching() {
        let alert = UIAlertController(title: "", message: "Passwords do not match. Please try again", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    func showAccountAlreadyExists() {
        let alert = UIAlertController(title: "", message: "Account already exists! Please enter a different email", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    func showPasswordLengthError() {
        let alert = UIAlertController(title: "", message: "Password must be 6 characters or longer", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    
    //MARK: We set the name of the user after we create the account...
    func setNameOfTheUserInFirebaseAuth(name: String){
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = name
        changeRequest?.commitChanges(completion: {(error) in
            if error == nil{
                //MARK: the profile update is successful...
                self.navigationController?.popToRootViewController(animated: true)
            }else{
                //MARK: there was an error updating the profile...
                print("Error occured: \(String(describing: error))")
            }
        })
    }
    
    
    // registers on Firebase
    func registerNewAccount(){
        showActivityIndicator()
        //MARK: create a Firebase user with email and password...
        if let name = registerScreen.textFieldName.text,
           let email = registerScreen.textFieldEmail.text,
           let password = registerScreen.textFieldPassword.text{
            //Validations....
            Auth.auth().createUser(withEmail: email, password: password, completion: {result, error in
                if error == nil{
                    //MARK: the user creation is successful...
                    self.hideActivityIndicator()
                    self.setNameOfTheUserInFirebaseAuth(name: name)
                    
                    let currUser = User(displayName: name, email: email, uid: (result?.user.uid)!)
                    
                    self.addNewUserToCollection(user: currUser)
                    
                }else{
                    //MARK: there is a error creating the user...
                    self.showAccountAlreadyExists()
                }
            })
        }
    }
    
    @objc func onButtonRegisterClicked() {
        if registerScreen.textFieldName.text! == "" || registerScreen.textFieldPassword.text! == "" {
            showEmptyFields()
        }
        else if !isValidEmail(email: registerScreen.textFieldEmail.text!) {
            showInvalidEmail()
        }
        else if registerScreen.textFieldPassword.text! != registerScreen.textfieldConfirmPassword.text! {
            showPasswordNotMatching()
        }
        else if registerScreen.textFieldPassword.text!.count < 6 {
            showPasswordLengthError()
        }
        else {
            registerNewAccount()
            
        }
    }
    
    func addNewUserToCollection(user: User) {
        let collectionUsers = database
            .collection("users")
        do {
            try collectionUsers.addDocument(from: user, completion: {(error) in
                if error == nil {
                    self.hideActivityIndicator()
                }
            })
        } catch {
            print("Error adding user to collection / doesnt exists")
        }
    }

    
}


extension RegisterViewController:ProgressSpinnerDelegate{
    func showActivityIndicator(){
        addChild(childProgressView)
        view.addSubview(childProgressView.view)
        childProgressView.didMove(toParent: self)
    }
    
    func hideActivityIndicator(){
        childProgressView.willMove(toParent: nil)
        childProgressView.view.removeFromSuperview()
        childProgressView.removeFromParent()
    }
}

