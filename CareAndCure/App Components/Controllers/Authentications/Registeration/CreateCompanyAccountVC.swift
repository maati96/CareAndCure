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
        setupDelegateTextField()
        createAccountBtn.isEnabled = false
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.5187388062, green: 0.7332572937, blue: 0.7236401439, alpha: 1)
        tabBarController?.tabBar.barTintColor = #colorLiteral(red: 0.5187388062, green: 0.7332572937, blue: 0.7236401439, alpha: 1)
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
        self.hidesBottomBarWhenPushed = true

        
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
        guard !phrmacyNameTextField.text!.isEmpty else {
            AlertService.showAlert(style: .alert, title: "حقل مطلوب", message: "اسم الصيدليه مطلوب")
            return
            
        }
        guard !phoneNumberTextField.text!.isEmpty else {
             AlertService.showAlert(style: .alert, title: "حقل مطلوب", message: "اكتب رقم موبايلك بشكل صحيح")
            return
            
        }
        guard !emailTextField.text!.isEmpty else {
            AlertService.showAlert(style: .alert, title: "حقل مطلوب", message: "اكتب البريد الإلكتروني بشكل صحيح")
            return
            
        }
        guard self.validation.validateEmailId(emailID: emailTextField.text!) else { return }
        guard self.validation.validaPhoneNumber(phoneNumber: phoneNumberTextField.text!) else { return }
        createAccountBtn.isEnabled = true
    }
}
