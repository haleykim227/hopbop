//
//  LoginViewController.swift
//  hop&bop
//
//  Created by Amy Sywe on 7/26/19.
//  Copyright © 2019 Haley Kim. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import GoogleSignIn

class LoginViewController: UIViewController, LoginButtonDelegate, GIDSignInUIDelegate, GIDSignInDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        
        let googleLoginButton = GIDSignInButton()
        googleLoginButton.center = view.center
        view.addSubview(googleLoginButton)
        
        let fbLoginButton = FBLoginButton()
        fbLoginButton.center = CGPoint(x: view.center.x, y: view.center.y + 50)
        fbLoginButton.delegate = self
        view.addSubview(fbLoginButton)
        
    }
    
    // Google GIDSignInDelegate Methods
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print("\(error.localizedDescription)")
        } else {
            DispatchQueue.main.async(){
                self.performSegue(withIdentifier: "loginToMain", sender: nil)
            }
            
            // Perform any operations on signed in user here.
            let userId = user.userID                  // For client-side use only!
            let idToken = user.authentication.idToken // Safe to send to the server
            /*let fullName = user.profile.name
             let givenName = user.profile.givenName
             let familyName = user.profile.familyName
             let email = user.profile.email
             */
        }
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
