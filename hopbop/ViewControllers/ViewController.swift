//
//  ViewController.swift
//  hop&bop
//
//  Created by Haley Kim on 7/25/19.
//  Copyright © 2019 Haley Kim. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import GoogleSignIn

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func logOutPressed(_ sender: Any) {
        let logOutManager = LoginManager()
        logOutManager.logOut()
        GIDSignIn.sharedInstance().signOut()
    }
    
}

