//
//  AppDelegate.swift
//  SkeletonDemo
//
//  Created by OminextMobile on 9/11/17.
//  Copyright © 2017 OminextMobile. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

    application.statusBarStyle = .lightContent
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.makeKeyAndVisible()
    window?.rootViewController = UINavigationController(rootViewController: ViewController())

    
    // dang o nhanh 4

    //dang o nhanh 1
    ///

    return true
  }

}

