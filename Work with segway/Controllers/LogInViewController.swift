//
//  ViewController.swift
//  Work with segway
//
//  Created by Irina Moiseeva on 02.02.2021.
//

import UIKit

class LogInViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private let user = "User"
    private let password = "Password"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let welcomeVC = segue.destination as! WelcomViewController
        welcomeVC.userName = user
    }
    
    @IBAction func logButtonPresed() {
        if nameTextField.text != user ||
            passwordTextField.text != password {
            showAlert(with: "Invalid login or password",
                      message: "Pleas, enter correct login and password")
            return
        }
        performSegue(withIdentifier: "showWelcom", sender: nil)
    }
    
    @IBAction func forgetUserName() {
        showAlert(with: "Oops!", message: "Your login is \(user)😉")
    }
    
    @IBAction func forgerPassword() {
        showAlert(with: "Oops!", message: "Your password is \(password)😉")
    }
}

// MARK: - Alert Controller
extension LogInViewController {
    private func showAlert(with title: String, message: String) {
        let alert = UIAlertController(title: title, message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.passwordTextField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - Work with keyboard
extension LogInViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            logButtonPresed()
        }
        return true
    }
}
