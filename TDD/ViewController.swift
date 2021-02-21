//
//  ViewController.swift
//  TDD
//
//  Created by admin on 19.02.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var validator = Validator()
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logInButton.isEnabled = false
        emailTF.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        passwordTF.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        print ("hello world")
    }

    @IBAction func LogInButtonPressed(_ sender: Any) {
        guard let email = emailTF.text, let pass = passwordTF.text else { return }
        check(email: email, password: pass)
    }
    
    @objc func textFieldDidChange() {
        guard let email = emailTF.text, let pass = passwordTF.text else { return }
            
        if !email.isEmpty && !pass.isEmpty {
            logInButton.isEnabled = true
        } else {
            logInButton.isEnabled = false
        }
    }
    
    func check(email: String, password: String) {
        if !validator.isEmailValid(email) {
           showAlertWithData(title: "Incorect email", message: "Check your email")
        } else if !validator.isPasswordValid(password) {
            showAlertWithData(title: "Incorect password", message: "Password should contain one capital letter, one digit and lenght should be more 6 letter")
        } else {
            performSegue(withIdentifier: "congratulations", sender: nil)
        }
    }
    
    func showAlertWithData(title: String, message: String) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        ac.addAction(cancel)
        present(ac, animated: true, completion: nil)
    }
    
}

