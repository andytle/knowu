	//
//  SignUpViewController.swift
//  knowu
//
//  Created by Andy Le on 6/26/20.
//  Copyright © 2020 Andy Le. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
    
class SignUpViewController: UIViewController {
    @IBOutlet weak var firstAndLastNameTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements() {
        errorLabel.alpha = 0
        Utilities.styleTextField(firstAndLastNameTextField)
        Utilities.styleTextField(usernameTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(signUpButton)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segueview controller.
     }.destination.
     // Pass the selected object to the new
    */
    func validateFields() -> String? {
        if firstAndLastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            usernameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all fields."
        }
        
        return nil
    }
    
    func showError(_ message:String){
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    @IBAction func signUpTapped(_ sender: Any) {
        
        let error = validateFields()
        
        if error != nil {
            showError(error!)
        }
        else {
            let firstAndLastName = firstAndLastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            //let username = usernameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                if err != nil {
                    self.showError(err!.localizedDescription)
                }
                else {
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: ["name":firstAndLastName, "userid":result!.user.uid], completion: { (error) in
                        if error != nil {
                            self.showError(error!.localizedDescription)
                        }
                    })
                    let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewControllerId") as? HomeViewController
                    self.view.window?.rootViewController = homeViewController
                    self.view.window?.makeKeyAndVisible()
                }
            }
        }
    }
}
