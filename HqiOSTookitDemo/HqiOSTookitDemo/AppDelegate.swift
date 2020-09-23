//
//  AppDelegate.swift
//  HqiOSTookitDemo
//
//  Created by hehuiqi on 2020/9/18.
//

import UIKit
import HqiOSTookit
@available(iOS 13.0,*)

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let hqfm = HqFileManager.init()
        print(hqfm.appDocmentDir?.path as Any)
        
        self.catchAllExectption()
        return true
    }
    func catchAllExectption()  {
        HqCatchException.shared.registerSignalHandler()
        HqCatchException.shared.catchExceptionHandler()
        
    }




}

