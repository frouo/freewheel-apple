//
//  MyLibrary.swift
//  MyLibrary-iOS
//
//  Created by François Rouault on 23/11/2020.
//

import AdManager
import Foundation

public enum MyLibrary {
  public static func initAdManager() {
    let adManager = AdManager.newAdManager()
    print("Hello \(String(describing: adManager))")
  }
}
