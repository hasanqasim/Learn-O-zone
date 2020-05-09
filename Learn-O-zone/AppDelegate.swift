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
        // Override point for customization after application launch.
        
//        UINavigationBar.appearance().barTintColor = UIColor(hexString: "d4f8e8")
//        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(hexString: "f67575")]
        //window = UIWindow(frame: UIScreen.main.bounds)
        window = UIWindow(frame: UIScreen.main.bounds)
        FirebaseApp.configure()
        observeAuthorisedState()
        return true
    }

    // MARK: UISceneSession Lifecycle

}

extension AppDelegate {
    private func observeAuthorisedState() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let rootVC = storyboard.instantiateViewController(identifier: "SplashViewController") as! SplashViewController
        //let rootNC = UINavigationController(rootViewController: rootVC)
        self.window!.rootViewController = rootVC
        self.window!.makeKeyAndVisible()
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if user == nil {
                let rootVC = storyboard.instantiateViewController(identifier: "AuthNavController") as! AuthNavController
                //let rootNC = UINavigationController(rootViewController: rootVC)
                self.window!.rootViewController = rootVC
                self.window!.makeKeyAndVisible()
            } else {
                let rootVC = storyboard.instantiateViewController(identifier: "MainTabController") as! MainTabController
                self.window?.rootViewController = rootVC
                self.window?.makeKeyAndVisible()
            }
        }
       
    }
    
}

