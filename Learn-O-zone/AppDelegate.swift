//
//  AppDelegate.swift
//  Learn-O-zone
//
//  Created by Hasan Qasim on 7/4/20.
//  Copyright © 2020 Hasan Qasim. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var handle: AuthStateDidChangeListenerHandle?
   

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        FirebaseApp.configure()
        observeAuthorisedState()
        return true
    }

    // MARK: UISceneSession Lifecycle

}

extension AppDelegate {
    
    func observeAuthorisedState() {
        window = UIWindow(frame: UIScreen.main.bounds)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let rootVC = storyboard.instantiateViewController(identifier: "SplashViewController") as! SplashViewController
        self.window!.rootViewController = rootVC
        self.window!.makeKeyAndVisible()
    
        
        DispatchQueue.main.asyncAfter(deadline:.now() + 3.0, execute: {
            self.handle = Auth.auth().addStateDidChangeListener { (auth, user) in
                //let currenetVC
                if user == nil {
                    let rootVC = storyboard.instantiateViewController(identifier: "AuthNavController") as! AuthNavController
                    self.window!.rootViewController = rootVC
                    self.window!.makeKeyAndVisible()
                    if (CurrentUser.getState()==true) {
                        let loginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                        rootVC.pushViewController(loginViewController, animated: true)
                        CurrentUser.setState(false)
                    }
                } else {
                    let rootVC = storyboard.instantiateViewController(identifier: "MainTabController") as! MainTabController
                    self.window?.rootViewController = rootVC
                    self.window?.makeKeyAndVisible()
                }
            }
        })
    }
}


