//
//  LoginVC.swift
//  CareAndCure
//
//  Created by Mohamed M3aty on 3/6/20.
//  Copyright © 2020 Mohamed M3aty. All rights reserved.
//

import UIKit


class LoginVC: UIViewController {
    
    
    @IBOutlet var nextBtn: UIButton! {
        didSet {
            nextBtn.layer.cornerRadius = 10
        }
    }
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextFiled: UITextField!
    @IBOutlet var pharmaciesBtn: UIButton!
    @IBOutlet var personBtnChecked: UIButton!
    @IBOutlet weak var createnewAccountBtn: UIButton!
    var validation = Validation()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func nextBtnPressed(_ sender: UIButton) {

    }
    
    @IBAction func checkBoxTapped(_ sender: UIButton) {
        if sender.tag == 1 {
            pharmaciesBtn.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
            personBtnChecked.setImage(#imageLiteral(resourceName: "checkbox"), for: .normal)
        } else {
            pharmaciesBtn.setImage(#imageLiteral(resourceName: "checkbox"), for: .normal)
            personBtnChecked.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
        }
    }
    
    
    @IBAction func createNewAccountBtnPressed(_ sender: UIButton) {
        guard let email = emailTextFiled.text,  let password = passwordTextField.text else {
                return
             }
        
        let isValidateEmail = self.validation.validateEmailId(emailID: email)
        if (isValidateEmail == false) {
           print("Incorrect Email")
           return
        }
        
        let isValidatePass = self.validation.validatePassword(password: password)
        if (isValidatePass == false) {
           print("Incorrect Pass")
           return
        }
        if (isValidateEmail == true || isValidatePass == true) {
           print("All fields are correct")
        }
    }
   
    
}

