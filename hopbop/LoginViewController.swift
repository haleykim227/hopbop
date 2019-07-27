//
//  LoginViewController.swift
//  hop&bop
//
//  Created by Amy Sywe on 7/26/19.
//  Copyright © 2019 Haley Kim. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class LoginViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let fbLoginButton = FBLoginButton(type: .roundedRect)
        fbLoginButton.center = view.center
        //self.view.addSubview(fbLoginButton)
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
