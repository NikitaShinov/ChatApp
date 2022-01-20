//
//  ChatViewController.swift
//  ChatApp
//
//  Created by max on 20.01.2022.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "⚡️FlashChat"
        navigationItem.hidesBackButton = true
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch _ as NSError {
            popUpWarning()
        }
    }
    
}

extension ChatViewController {
    private func popUpWarning() {
        let alert = UIAlertController(title: "Error", message: "Sign out error. Please try again.", preferredStyle: .alert)
        let action = UIAlertAction(title: "Dismiss", style: .destructive, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
