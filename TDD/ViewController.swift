//
//  ViewController.swift
//  TDD
//
//  Created by admin on 19.02.2021.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print ("hello world")
    }

    @IBAction func LogInButtonPressed(_ sender: Any) {
    }
    
}

