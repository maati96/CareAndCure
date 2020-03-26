//
//  CreateAcountVC.swift
//  CareAndCure
//
//  Created by Mohamed M3aty on 3/6/20.
//  Copyright © 2020 Mohamed M3aty. All rights reserved.
//

import UIKit

class CreateIndividualAcountVC: UIViewController {
    
 
    @IBOutlet var createAccBtn: UIButton! {
        didSet {
            createAccBtn.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailAdressTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var locationBtn: UIButton!
    
    var validation = Validation()

    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         
    }

  
    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createAccountPressed(_ sender: UIButton) {
        
       guard let name = firstNameTextField.text, let lastName = lastNameTextField.text, let email = emailAdressTextField.text,
            let phone = phoneNumberTextField.text else {
                
                return
        }
        
        let isValidateName = self.validation.validateName(name: name)
        if (isValidateName == false) {
            createAccBtn.isEnabled = false
            print("Incorrect Name")
            
        } else {
            createAccBtn.isEnabled = true
        }
        let isValidateLastName = self.validation.validateName(name: lastName)
               if (isValidateLastName == false) {
                   createAccBtn.isEnabled = false
                   print("Incorrect Name")
                   
               } else {
                   createAccBtn.isEnabled = true
               }
               
        let isValidateEmail = self.validation.validateEmailId(emailID: email)
        if (isValidateEmail == false) {
            print("Incorrect Email")
            createAccBtn.isEnabled = false

        }else {
            createAccBtn.isEnabled = true
        }
        
        let isValidatePhone = self.validation.validaPhoneNumber(phoneNumber: phone)
        if (isValidatePhone == false) {
            createAccBtn.isEnabled = false

            print("Incorrect Phone")
            return
        }else {
            createAccBtn.isEnabled = true
        }
        if (isValidateName == true || isValidateEmail == true  || isValidatePhone == true) {
            print("All fields are correct")
        }
    }
    
    
}

extension CreateIndividualAcountVC: UITextFieldDelegate {
    
}
