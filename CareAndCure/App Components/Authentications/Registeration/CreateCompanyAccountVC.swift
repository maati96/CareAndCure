//
//  CreateCompanyAccountVC.swift
//  CareAndCure
//
//  Created by Mohamed M3aty on 3/22/20.
//  Copyright © 2020 Mohamed M3aty. All rights reserved.
//

import UIKit

class CreateCompanyAccountVC: UIViewController {
    
    @IBOutlet weak var createAccountBtn: UIButton!  {
        didSet {
            createAccountBtn.layer.cornerRadius = 10
        }
    }
    var validation = Validation()
    @IBOutlet weak var phrmacyNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var locationBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
//        createAccountBtn.isEnabled = false
    }
    
    
    
    @IBAction func createAccountPressed(_ sender: UIButton) {
        guard let phrmacyName = phrmacyNameTextField.text, let email = emailTextField.text,
            let phone = phoneNumberTextField.text else {
                
                return
        }
        let isValidateName = self.validation.validateName(name: phrmacyName)
        if (isValidateName == false) {
            createAccountBtn.isEnabled = false
            print("Incorrect Name")
            
        } else {
            createAccountBtn.isEnabled = true
        }
        let isValidateEmail = self.validation.validateEmailId(emailID: email)
        if (isValidateEmail == false) {
            print("Incorrect Email")
            createAccountBtn.isEnabled = false

        }else {
            createAccountBtn.isEnabled = true
        }
        
        let isValidatePhone = self.validation.validaPhoneNumber(phoneNumber: phone)
        if (isValidatePhone == false) {
            createAccountBtn.isEnabled = false

            print("Incorrect Phone")
            return
        }else {
            createAccountBtn.isEnabled = true
        }
        if (isValidateName == true || isValidateEmail == true  || isValidatePhone == true) {
            print("All fields are correct")
        }
    }
    
}


