//
//  LoginVC.swift
//  CareAndCure
//
//  Created by Mohamed M3aty on 3/6/20.
//  Copyright © 2020 Mohamed M3aty. All rights reserved.
//

import UIKit
import Alamofire

class LoginVC:UIViewController {
    
    
    
    
    @IBOutlet var nextBtn: UIButton! {
        didSet {
            nextBtn.layer.cornerRadius = 10
        }
    }
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userNameTextFiled: UITextField!
    @IBOutlet weak var createnewAccountBtn: UIButton!
    
    var validation = Validation()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupDelegateTF()
    }
    
    func setupDelegateTF()  {
        userNameTextFiled.delegate = self
        passwordTextField.delegate = self
    }
    
    
    func loginUser(username: String, password: String, completion: @escaping (Result<LoginUser>) -> Void) {
        Alamofire.request(AuthRouter.login(username: username, password: password)).responseData { (response) in
//            print("Show Response: ",String.init(data:response.data!, encoding:.utf8)!)
            
            
            switch response.result {
            case .success(let data):
                do {
                    let result = try JSONDecoder().decode(LoginUser.self, from: data)
                    print(result.token!)
                    UserDefault.instance.authToken = result.token!
                    UserDefault.instance.isLoggedIn = true
                    let tabbarVC = self.storyboard?.instantiateViewController(identifier: "tabbarVC") as! UITabBarController
                    self.present(tabbarVC, animated: true, completion: nil)
                } catch {
                    print(error.localizedDescription)
                    completion(.failure(error))
                }
            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
        
    }
    
    @IBAction func nextBtnPressed(_ sender: UIButton) {
        
        guard let username = userNameTextFiled.text, userNameTextFiled.text != "" else { return }
        guard let password = passwordTextField.text, passwordTextField.text != "" else { return }
        loginUser(username: username, password: password) { (result) in
            print(result)
        }
    }
    
    
    
    @IBAction func createNewAccountBtnPressed(_ sender: UIButton) {
        
        
    }
    
    
    
    
    
    
}

extension LoginVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        return true
    }
    
    
    
}

