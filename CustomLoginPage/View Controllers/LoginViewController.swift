//
//  LoginViewController.swift
//  CustomLoginPage
//
//  Created by Jaldeep Patel on 2021-05-04.
//

import UIKit
import Firebase

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var errorLabel: UILabel!
    @IBOutlet var gmailLoginButton: UIButton!
    @IBOutlet var facebookLoginButton: UIButton!
    
    var isIconClicked = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElement()
        //getNavigationBarGradient()
        
    }
    
    func setUpElement() {
        
        //Hide the error label
        errorLabel.alpha = 0
        
        //Set images for textFields
        let emailIcon = UIImage(named: "email")
        let passwordLeftIcon = UIImage(named: "password")
        let passwordRightIcon = UIImage(named: "closedEye")
        
        //Style the elements
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleButton(loginButton)
        Utilities.styleButton(facebookLoginButton)
        Utilities.styleButton(gmailLoginButton)
        Utilities.addTextFieldImage(textField: emailTextField, andImage: emailIcon!)
        Utilities.addTextFieldImage(textField: passwordTextField, andImage: passwordLeftIcon!)
        addPasswordEyeIcon(textField: passwordTextField, andImage: passwordRightIcon!)
    }
    
    //Check the fields and validate that the data is correct. If everything is correct, this method returns
    // nil. Otherwise, it returns the error message
    func validateFields() -> String? {
        
        //Validate any field is not blank
        if emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Email or password are blank."
        }
        
        //Validate Email format is correct
        let cleanedEmail = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if Utilities.isEmailValid(cleanedEmail) == false {
            
            return "Please enter correct email."
        }
        
        //Validate password is correct
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if Utilities.isPasswordValid(cleanedPassword) == false {
            
            return "Please enter correct password."
        }
        
        return nil
    }
    
    
    @IBAction func loginTapped(_ sender: UIButton) {
        
        let error = validateFields()
        
        if error != nil {
            
            //There's something wrong
            errorLabel.text = error!
            errorLabel.alpha = 1
            
        } else {
            
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            //Sign in the User
            Auth.auth().signIn(withEmail: email, password: password) { result, err in
                
                //There is something wrong
                if err != nil {
                    self.errorLabel.text = err!.localizedDescription
                    self.errorLabel.alpha = 1
                } else {
                    
                    //Everything is fine, redirect to TabBarViewController
                    let tabBarViewController = self.storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.tabBarViewController) as! UITabBarController
                    self.view.window?.rootViewController = tabBarViewController
                    self.view.window?.makeKeyAndVisible()
                    
                    //self.performSegue(withIdentifier: "navigateToHome", sender: self)
                }
            }
        }
        
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    
    
    @IBAction func signUpTapped(_ sender: UIButton) {
        //performSegue(withIdentifier: Constants.Storyboard.signUpSegue, sender: nil)
        
    }
    
    
    @IBAction func forgotPasswordTapped(_ sender: UIButton) {
        //performSegue(withIdentifier: Constants.Storyboard.forgotPasswordSegue, sender: nil)
    }
    
    
    @IBAction func facebookLoginTapped(_ sender: UIButton) {
    
        UIApplication.shared.open(URL(string: "https://www.facebook.com")!, options: [:], completionHandler: nil)
    }
    
    
    
    @IBAction func gmailLoginTapped(_ sender: UIButton) {
        
    }
    
    //Dismiss keyboard when touch outside
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    func addPasswordEyeIcon(textField: UITextField, andImage image: UIImage) {
        
        //Create textField view
        let textFieldRightView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        
        //Create textField subview and add image
        let textFieldImageView = UIImageView(image: image)
        
        //Set subview frame
        textFieldImageView.frame = CGRect(x: 0, y: 8, width: 25, height: 25)
        
        //Add subview
        textFieldRightView.addSubview(textFieldImageView)
        
        //Set leftside textField properties
        textField.rightView = textFieldRightView
        textField.rightViewMode = .always
        
       
        //Add color to textField Image
        textFieldImageView.tintColor = .darkGray
        
        //Add Tap Gesture
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer: )))
        textFieldImageView.isUserInteractionEnabled = true
        textFieldImageView.addGestureRecognizer(tapGestureRecognizer)
        
        
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        
        let tappedImage = tapGestureRecognizer.view as! UIImageView
         
        if isIconClicked {
            isIconClicked = false
            tappedImage.image = UIImage(named: "openEye")
            passwordTextField.isSecureTextEntry = false
            
        } else {
            isIconClicked = true
            tappedImage.image = UIImage(named: "closedEye")
            passwordTextField.isSecureTextEntry = true
        }
        
    }
}




