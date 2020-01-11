//
//  AppDelegate.swift
//  CryptoConverter
//
//  Created by Zhaniya Zhukesheva on 27/08/2019.
//  Copyright © 2019 Zhaniya Zhukesheva. All rights reserved.
//

import UIKit
import Realm
import RealmSwift
import RevealingSplashView



@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let revealSplashView = RevealingSplashView(iconImage: #imageLiteral(resourceName: "launch"), iconInitialSize: CGSize(width: 150, height: 150), backgroundColor: UIColor(r: 4, g: 23, b: 45))


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        UINavigationBar.appearance().barTintColor = UIColor(r: 22, g: 57, b: 79)
        UINavigationBar.appearance().tintColor = .white
        
        
        
        let config = Realm.Configuration(
            schemaVersion: 2,
            migrationBlock: { migration, oldSchemaVersion in
                
                if (oldSchemaVersion < 2) {
                    // Nothing to do!
                    
                }
        })
        Realm.Configuration.defaultConfiguration = config
        
        let configCheck = Realm.Configuration();

        if let fileURL = configCheck.fileURL {
            do {
                let fileUrlIs = try schemaVersionAtURL(fileURL)
                print("schema version \(fileUrlIs)")
            } catch  {
                print(error)
            }
        }
        
   
//
//        NotificationCenter.default.addObserver(self, selector: #selector(setTimerForSplashView), name: Notificator.timerNotification, object: nil)
        
        return true
        
   }

//    @objc func setTimerForSplashView() {
//
//        revealSplashView.heartAttack = true
//
//    }
    
    func applicationWillResignActive(_ application: UIApplication) {
       
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
       
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
       
    }

    func applicationWillTerminate(_ application: UIApplication) {
        
    }

}




