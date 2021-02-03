//
//  WelcomViewController.swift
//  Work with segway
//
//  Created by Irina Moiseeva on 02.02.2021.
//

import UIKit

class WelcomViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var welcomLabel: UILabel!
    @IBOutlet weak var emojiLabel: UILabel!
    
    var userName: String?
    
    override func viewWillAppear(_ animated: Bool) {
        setGradientBackground()
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emojiLabel.text = "👋"
        
        guard let userName = self.userName else { return }
        welcomLabel.text = "Welcom, \(userName)"
    }
    
    @IBAction func logOut() {
        
        dismiss(animated: true)
    }
    
    func setGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [UIColor.blue.cgColor, UIColor.white.cgColor]
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
