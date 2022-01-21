//
//  RegisterViewController.swift
//  ChatApp
//
//  Created by max on 20.01.2022.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let _ = error {
                    self.popUpWarning()
                } else {
                     //Navigate to chat vc
                    self.performSegue(withIdentifier: Constants.registerSegue, sender: self)
                }
            }
        }
        
    }
    
}

extension RegisterViewController {
    private func popUpWarning() {
        let alert = UIAlertController(title: "Error", message: "Authentification error. Please check the entered credentials.", preferredStyle: .alert)
        let action = UIAlertAction(title: "Dismiss", style: .destructive, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
