//
//  LoginViewController.swift
//  ChatApp
//
//  Created by max on 20.01.2022.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    

    @IBAction func loginPressed(_ sender: UIButton) {
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                guard let strongSelf = self else { return }
                if let _ = error {
                    strongSelf.popUpWarning()
                } else {
                    strongSelf.performSegue(withIdentifier: Constants.loginSegue, sender: self)
                }
            }
        }
        
    }
}

extension LoginViewController {
    private func popUpWarning() {
        let alert = UIAlertController(title: "Error", message: "Authentification error. Please check your email/password entry.", preferredStyle: .alert)
        let action = UIAlertAction(title: "Dismiss", style: .destructive, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
