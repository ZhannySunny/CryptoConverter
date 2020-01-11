//
//  Notificator.swift
//  CryptoConverter
//
//  Created by Zhaniya Zhukesheva on 21/09/2019.
//  Copyright © 2019 Zhaniya Zhukesheva. All rights reserved.
//

import Foundation

class Notificator {
    
    static let timerNotification = NSNotification.Name(rawValue: "timerNotification")
    
    static let firstQuoteNameNotification = NSNotification.Name(rawValue: "furstQuoteNameNotification")
    
    static let secondQuoteNameNotification = NSNotification.Name(rawValue: "secondQuoteNameNotification")
    
    static let getQuotesNotification = NSNotification.Name(rawValue: "getQuotesNotification")
    
}
