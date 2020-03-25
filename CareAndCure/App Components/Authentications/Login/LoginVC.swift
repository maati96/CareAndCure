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
    @IBOutlet weak var createnewAccountBtn: UIButton!
    
    var validation = Validation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupDelegateTF()
    }
    
    func setupDelegateTF()  {
        emailTextFiled.delegate = self
        passwordTextField.delegate = self
    }
    
    @IBAction func nextBtnPressed(_ sender: UIButton) {
        
    }
    

    
    
    @IBAction func createNewAccountBtnPressed(_ sender: UIButton) {
        
        
    }
    
    
}

extension LoginVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        if emailTextFiled == textField || passwordTextField == textField  {
            validateTF()
        }
    }
    
    func validateTF() {
        guard !emailTextFiled.text!.isEmpty else { return }
        guard !passwordTextField.text!.isEmpty else { return }
    }
    
}
