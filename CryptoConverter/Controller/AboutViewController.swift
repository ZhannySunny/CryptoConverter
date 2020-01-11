//
//  AboutViewController.swift
//  CryptoConverter
//
//  Created by Zhaniya Zhukesheva on 30/10/2019.
//  Copyright © 2019 Zhaniya Zhukesheva. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var appInfo: UILabel!
    
    @IBOutlet weak var photo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appInfo.sizeToFit()
        
       photo.layer.cornerRadius = photo.frame.size.width / 2
       photo.clipsToBounds = true 
        

    }
    

    
    

}
