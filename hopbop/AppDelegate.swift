//
//  AppDelegate.swift
//  hop&bop
//
//  Created by Haley Kim on 7/25/19.
//  Copyright © 2019 Haley Kim. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import GoogleSignIn
import GoogleMaps

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let googleClientID: String = "1071757962127-0t0alnu7kc1o315mpml6n7b3j37q5q40.apps.googleusercontent.com"
    let googleAPIKey: String = "AIzaSyBAhV4pwy6d_oiKLG-R6WUh1ckrWHYctIc"
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // FB Login
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        
        // Google: initialize sign-in
        GIDSignIn.sharedInstance().clientID = googleClientID
        
        // GoogleMaps initialization
        GMSServices.provideAPIKey(googleAPIKey)
        
        
        // If user is logged in, immediately go to mapViewController.

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        window = UIWindow(frame: UIScreen.main.bounds)
        if (AccessToken.current != nil) || GIDSignIn.sharedInstance().hasAuthInKeychain() {
            // A user is already logged in.
            let mainTabBarController = storyboard.instantiateViewController(withIdentifier: "mainTabBarController")
            window?.rootViewController = mainTabBarController
        }
        else {
            let loginViewController = storyboard.instantiateViewController(withIdentifier: "loginViewController")
            window?.rootViewController = loginViewController
        }
        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        let googleDidHandle = GIDSignIn.sharedInstance().handle(url as URL?,
                                          sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
                                          annotation: options[UIApplication.OpenURLOptionsKey.annotation])
        let fbDidHandle =  ApplicationDelegate.shared.application(app, open: url, options: options)
        
        return googleDidHandle || fbDidHandle
    }


    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

