//
//  LoginViewController.swift
//  hop&bop
//
//  Created by Amy Sywe on 7/26/19.
//  Copyright © 2019 Haley Kim. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class LoginViewController: UIViewController, LoginButtonDelegate{
    
    //@IBOutlet var fbLoginButton: FBButton!
    //@IBOutlet weak var fbLoginButton: FBButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Check if a user is already logged in.
        if let accessToken = AccessToken.current {
            // A user is already logged in.
            print("User \(accessToken.userID) is logged in!")
            DispatchQueue.main.async(){
                self.performSegue(withIdentifier: "loginToMain", sender: nil)
            }
        }
        
        let fbLoginButton = FBLoginButton(type: .roundedRect)
        fbLoginButton.center = view.center
        fbLoginButton.delegate = self
        //fbLoginButton = fbLoginB
        //fbLoginB.addTarget(self, action: #selector(self.loginButtonClicked), for: .touchUpInside)
        //fbLoginButton = fbLoginB
        //fbLoginButton.center = view.center
        
        // Handle clicks on the button
        //fbLoginButton.addTarget(self, action: #selector(self.loginButtonClicked), for: .touchUpInside)
        
        view.addSubview(fbLoginButton)
        //fbLoginButton.center = view.center
        
        
    }
    /*
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        //print("check")
        if identifier == "loginToMain" {
            if let accessToken = AccessToken.current {
                // A user is already logged in
                print("User \(accessToken.userID) is logged in!")
                print("segue")
                return true
            }
            print("no segue")
            return false
        }
        return true
    }
    */
    
    // Once the button is clicked, show the login dialog
    @objc func loginButtonClicked() {
        
        let loginManager = LoginManager()
        //loginManager.logOut()
        loginManager.logIn(permissions: ["public_profile"], from: self) { (result, error) in
            print("login attempt")
            if let err = error {
                print(err.localizedDescription)
            }
            else {
                if result!.isCancelled {
                    print("Login cancelled.")
                }
                else {
                    print("Logged in.")
                    print("User \(AccessToken.current!.userID) is logged in!")
                    DispatchQueue.main.async(){
                        self.performSegue(withIdentifier: "loginToMain", sender: nil)
                    }
                    
                }
            }
        }
        /*
        if let accessToken = AccessToken.current {
            print("User \(accessToken.userID) is logged in!")
            DispatchQueue.main.async(){
                self.performSegue(withIdentifier: "loginToMain", sender: nil)
            }
        }
 */
    }
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        if let err = error {
            print(err.localizedDescription)
        }
        else {
            if let res = result {
                if res.isCancelled {
                    print("Login cancelled.")
                }
                else {
                    print("User \(AccessToken.current!.userID) is logged in!")
                    DispatchQueue.main.async(){
                        self.performSegue(withIdentifier: "loginToMain", sender: nil)
                    }
                }
            }
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        
    }
    
    
    /*
    override func viewWillAppear(_ animated: Bool) {
        let fbLoginB = FBLoginButton(type: .roundedRect)
        fbLoginB.center = view.center
        //fbLoginB.addTarget(self, action: #selector(self.loginButtonClicked), for: .touchUpInside)
        fbLoginButton = fbLoginB
        //view.addSubview(fbLoginB)
    }*/
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
