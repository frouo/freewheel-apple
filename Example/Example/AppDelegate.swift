//
//  AppDelegate.swift
//  Example
//
//  Created by François Rouault on 13/11/2020.
//  Copyright © 2020 François Rouault. All rights reserved.
//

import MyLibrary
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    MyLibrary.initAdManager()

    return true
  }

}

