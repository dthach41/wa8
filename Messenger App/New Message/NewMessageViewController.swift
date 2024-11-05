//
//  NewMessageViewController.swift
//  Messenger App
//
//  Created by Derek Thach on 11/5/24.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class NewMessageViewController: UIViewController {

    let newMessageScreen = NewMessageView()
    
    let database = Firestore.firestore()
    
    let childProgressView = ProgressSpinnerViewController()
    
    var currentUser: FirebaseAuth.User!
    var otherUserID: String!
    
    override func loadView() {
        view = newMessageScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "New Message"
        
        newMessageScreen.buttonSend.addTarget(self, action: #selector(onClickButtonSend), for: .touchUpInside)
        
    }
    
    func showErrorAlert(errorText:String) {
        let alert = UIAlertController(title: "Error", message: errorText, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    // gets user uid by their email
    func getUserUID(byEmail email: String, completion: @escaping (String?) -> Void) {
        let db = Firestore.firestore()
        let usersRef = db.collection("users")

        usersRef.whereField("email", isEqualTo: email).getDocuments { (snapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
                completion(nil)
                return
            }

            guard let documents = snapshot?.documents, !documents.isEmpty else {
                print("No user found with the provided email.")
                completion(nil)
                return
            }

            // Assuming email is unique, we get the first matching document
            let userData = documents[0].data()
            if let uid = userData["uid"] as? String {
                completion(uid)
            } else {
                print("UID not found in user data.")
                completion(nil)
            }
        }
    }
    
    
    
    // create a new chat collection if not already existed
    @objc func onClickButtonSend() {
        if let messageText = newMessageScreen.textViewMessage.text {
            
            let sentToEmail = newMessageScreen.textFieldEmail.text!
            getUserUID(byEmail: sentToEmail) { uid in
                if let uid = uid {
                    self.showActivityIndicator()
                    self.otherUserID = uid
                    
                    let newMessage = Message(uid: self.currentUser.uid, name: self.currentUser.displayName!, text: messageText)
                    
                    self.addChatToFirestore(chat: Chat(
                        participants:[self.currentUser.uid, uid],
                        lastMessage: "",
                        lastMessageTime: Date()))
                    
                    self.addMessageToFirestore(message: newMessage)
                    
                    
                    
                    
                    
                } else {
                    print("User not found.")
                }
            }

            
        } else {
            showErrorAlert(errorText: "Cannot send empty message!")
        }
    }
    
    // adds a new chat document to chats collection
    func addChatToFirestore(chat: Chat) {

        let collectionChat = database
            .collection("chats")
        do {
            try collectionChat.addDocument(from: chat, completion: {(error) in
                if error == nil {
                    
                }
            })
        } catch {
            print("Error adding chat to firestore collection")
        }
    }
    
    
    func addMessageToFirestore(message: Message) {
        
        let collectionMessages = database
            .collection("chats")
            .document(message.uid)
            .collection("messages")
        
        do {
            try collectionMessages.addDocument(from: message, completion: {(error) in
                if error == nil {
                    self.hideActivityIndicator()
                    self.navigationController?.popViewController(animated: true)
                }
            })
        } catch {
            print("Error adding message to chat")
        }
    }


}

extension NewMessageViewController:ProgressSpinnerDelegate{
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
