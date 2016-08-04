//
//  AppDelegate.swift
//  GitHubOAuth
//
//  Created by Joel Bell on 7/31/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        return true
    }
    
    func application(app: UIApplication, openURL url: NSURL, options: [String : AnyObject]) -> Bool {
        guard let value = options["UIApplicationOpenURLOptionsSourceApplicationKey"] as? String else {fatalError("Couldn't pull String value from options Dictionary")}
        
        if value == "com.apple.SafariViewService" {
            NSNotificationCenter.defaultCenter().postNotificationName("HEY! SOMETHING HAPPENED!", object: Notification.closeSafariVC)
            return true
        }
        return false
    }
}