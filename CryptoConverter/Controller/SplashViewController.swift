//
//  SplashViewController.swift
//  CryptoConverter
//
//  Created by Zhaniya Zhukesheva on 31/10/2019.
//  Copyright © 2019 Zhaniya Zhukesheva. All rights reserved.
//

import UIKit
import RevealingSplashView

class SplashViewController: UIViewController {
    
    let revealSplashView = RevealingSplashView(iconImage: #imageLiteral(resourceName: "launch"), iconInitialSize: CGSize(width: 150, height: 150), backgroundColor: UIColor(r: 4, g: 23, b: 45))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        revealSplashView.animationType = .rotateOut
        revealSplashView.duration = 3.0
        view.addSubview(revealSplashView)
        revealSplashView.startAnimation()
        
        Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(toTabBar), userInfo: nil, repeats: false)

        // Do any additional setup after loading the view.
    }
    
    
    @objc func toTabBar() {
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc: UITabBarController = storyboard.instantiateViewController(withIdentifier: "TabBarControllerID") as! TabBarController
        present(vc, animated: true, completion: nil)
        
//        let navigationController = UINavigationController(rootViewController: vc)
//        self.present(navigationController, animated: true, completion: nil)
        
    }
    
    
    
    
    
}
