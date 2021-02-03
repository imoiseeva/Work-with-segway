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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if nameTextField.text == "User",
           passwordTextField.text == "Password" {
            guard let welcomVC = segue.destination as? WelcomViewController
            else {return}
            welcomVC.userName = nameTextField.text
            nameTextField.text = ""
            passwordTextField.text = ""
        } else {
            showAlert(with: "Invalod login or password",
                      message: "Pleas, enter correct login and password")
        }
    }
    
    @IBAction func forgetUserName() {
        showAlert(with: "Oops!", message: "Your login is User😉")
    }
    
    @IBAction func forgerPassword() {
        showAlert(with: "Oops!", message: "Your password is Password😉")
    }
}

// MARK: - Alert Controller
extension LogInViewController {
    private func showAlert(with title: String, message: String) {
        let alert = UIAlertController(title: title, message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.nameTextField.text = ""
            self.passwordTextField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
