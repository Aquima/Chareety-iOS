//
//  AppDelegate.swift
//  Chareety
//
//  Created by Raul Quispe on 12/22/16.
//  Copyright © 2016 Chareety. All rights reserved.
//

import UIKit
import CoreData
import Fabric
import TwitterKit
import GoogleSignIn

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {

    var window: UIWindow?

    var splashVC:SplashviewControllerViewController!
    
    var navigatorViewController:UINavigationController!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        Fabric.with([Twitter.self])

        window? = UIWindow()
        splashVC = SplashviewControllerViewController()
        navigatorViewController = UINavigationController.init(rootViewController: splashVC)
        navigatorViewController.navigationBar.isHidden = true
        window?.rootViewController = navigatorViewController

        // Initialize sign-in
        GIDSignIn.sharedInstance().clientID = "936638009515-ojjkqr6ojine1s6cq04sire95glrt1bg.apps.googleusercontent.com"
        GIDSignIn.sharedInstance().delegate = self

        PayPalMobile.initializeWithClientIds(forEnvironments:[PayPalEnvironmentProduction: "YOUR_CLIENT_ID_FOR_PRODUCTION",
                                                                PayPalEnvironmentSandbox: "AT1hLTTVeF6bcMajobSgIYTvQnoJsN0-BP-fn6k_rpErWjOdnjZTDHrpwC3lS96zSJFZIOozRX9WW-w-"])

        return FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
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
        // Saves changes in the application's managed object context before the application terminates.
        do{
            try Storage.shared.context.save()
        }catch{
            NSLog("NSLO")
        }
    }
    public func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        if url.scheme == "fb2187820874777384" {
            return FBSDKApplicationDelegate.sharedInstance().application(
                app,
                open: url as URL!,
                sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as! String,
                annotation: options[UIApplicationOpenURLOptionsKey.annotation]
            )

        }else{
            return GIDSignIn.sharedInstance().handle(url,
                                                     sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String,
                                                     annotation: options[UIApplicationOpenURLOptionsKey.annotation])
            

        }
    }
    
    public func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        return FBSDKApplicationDelegate.sharedInstance().application(
            application,
            open: url as URL!,
            sourceApplication: sourceApplication,
            annotation: annotation)
    }
    // MARK : GOOGLE
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!){
        if let error = error {
            print(error.localizedDescription)
            return
        }
    }
//    func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!,
//                withError error: NSError!) {
//        if let error = error {
//            print(error.localizedDescription)
//            return
//        }
//        // ...
//    }
//


}

