//
//  MyLibrary.swift
//  MyLibrary-iOS
//
//  Created by François Rouault on 23/11/2020.
//

import Foundation

public enum MyLibrary {
  public static func sayHello() {
    let adManager = newAdManager()
    print("Hello \(String(describing: adManager))")
  }
}
