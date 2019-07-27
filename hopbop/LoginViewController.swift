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
        view.addSubview(fbLoginButton)
    }
    
    // FB LoginButtonDelegate Methods
    
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
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
