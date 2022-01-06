//
//  AppDelegate.swift
//  EyelidDivination-ios
//
//  Created by mac on 2021/12/29.
//

import UIKit
import Firebase
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        // Override point for customization after application launch.
        return true
    }




}

