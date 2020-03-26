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
        createAccountBtn.isEnabled = false
        setupDelegateTextField()
        
    }
    
    func  setupDelegateTextField() {
        phoneNumberTextField.delegate = self
        emailTextField.delegate = self
        phoneNumberTextField.delegate = self
    }
    
    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createAccountPressed(_ sender: UIButton) {
        
        
    }
  
    
    
}


extension CreateCompanyAccountVC: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        if phoneNumberTextField == textField || phrmacyNameTextField == textField || emailTextField == textField {
            validateTF()
        }
    }
    
    func validateTF() {
        guard !phrmacyNameTextField.text!.isEmpty else { return }
        guard !phoneNumberTextField.text!.isEmpty else { return }
        guard !emailTextField.text!.isEmpty else { return }
        
        guard self.validation.validateEmailId(emailID: emailTextField.text!) else { return }
        guard self.validation.validaPhoneNumber(phoneNumber: phoneNumberTextField.text!) else { return }
        createAccountBtn.isEnabled = true
    }
}
