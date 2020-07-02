//
//  CreateAcountVC.swift
//  CareAndCure
//
//  Created by Mohamed M3aty on 3/6/20.
//  Copyright © 2020 Mohamed M3aty. All rights reserved.
//

import UIKit
import Alamofire

class CreateIndividualAcountVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var createAccBtn: UIButton! {
        didSet {
            createAccBtn.layer.cornerRadius = 10
        }
    }
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailAdressTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    
    var validation = Validation()
    let login = LoginVC()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.5187388062, green: 0.7332572937, blue: 0.7236401439, alpha: 1)
        tabBarController?.tabBar.barTintColor = #colorLiteral(red: 0.5187388062, green: 0.7332572937, blue: 0.7236401439, alpha: 1)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func registerUser(username: String, email: String, password: String, completion: @escaping (Result<Signup>) -> Void) {
        
        Alamofire.request(AuthRouter.signup(username: username, email: email, password: password)).debugLog().responseData { response in
            print("Show Response: ",String.init(data:response.data!, encoding:.utf8)!)
            switch response.result {
            case .success(let data):
                do {
                    let result = try JSONDecoder().decode(Signup.self, from: data)
                    print(result.username ?? "no data")
                    UserDefault.instance.authToken = result.token!
                    UserDefault.instance.isLoggedIn = true
                    let tabbarVC = self.storyboard?.instantiateViewController(identifier: "tabbarVC") as! UITabBarController
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
    
    
    @IBAction func createAccountPressed(_ sender: UIButton) {
        guard let username = usernameTextField.text, usernameTextField.text != "" else { return }
        guard let email = emailAdressTextField.text, emailAdressTextField.text != "" else { return }
        guard let password = passwordTextField.text, passwordTextField.text != "" else { return }
        registerUser(username: username, email: email, password: password) { (result) in
            self.login.loginUser(username: username, password: password) { (success) in
                if success.value != nil {
                    print("logged in User!", UserDefault.instance.authToken)
             
                }
            }
        }
    }
    
    
}



