//
//  Cryptoconverter.swift
//  CryptoConverter
//
//  Created by Zhaniya Zhukesheva on 27/08/2019.
//  Copyright © 2019 Zhaniya Zhukesheva. All rights reserved.
//

import Foundation
import UIKit

class Quote: Decodable {
    
    var id: String = ""
    var name: String = ""
    var symbol: String = ""
    var rank: String = ""
    var price_usd: String = ""
    var price_btc: String = ""
    var dailyVolumeUSD: String = ""
    var market_cap_usd: String = ""
    var available_supply: String? = ""
    var total_supply: String? = ""
    var max_supply: String? = ""
    var percent_change_1h: String = ""
    var percent_change_24h: String = ""
    var percent_change_7d: String = ""
    var last_updated: String? = ""
    
    var image: String {
    
        get {
            
            return "\(self.symbol)"
        }
    
    }
    
    enum CodingKeys: String, CodingKey {
        
        case id
        case name
        case symbol
        case rank
        case price_usd
        case price_btc
        case dailyVolumeUSD = "24h_volume_usd"
        case market_cap_usd
        case available_supply
        case total_supply
        case max_supply
        case percent_change_1h
        case percent_change_24h
        case percent_change_7d
        case last_updated
        
    }
    
    //MARK: Convertation
    
    init(from cached: QuoteCached) {
        
        self.id = cached.id
        self.name = cached.name
        self.symbol = cached.symbol
        self.rank = cached.rank
        self.price_usd = cached.price_usd
        self.price_btc = cached.price_btc
        self.dailyVolumeUSD = cached.dailyVolumeUSD
        self.market_cap_usd = cached.market_cap_usd
        self.available_supply = cached.available_supply
        self.total_supply = cached.total_supply
        self.max_supply = cached.max_supply
        self.percent_change_1h = cached.percent_change_1h
        self.percent_change_24h = cached.percent_change_24h
        self.percent_change_7d = cached.percent_change_7d
        self.last_updated = cached.last_updated
        
        
        
    }

    func formattedBillion() -> String {
        
        
        let number = self.market_cap_usd.toDouble()
        let billion = number / 1000000000
        let million = number / 1000000
        
        if billion >= 1.0 {
            
            return "\(round(billion*10)/10) B"
        }
        else if million >= 1.0 {
            
            return "\(round(million*10)/10) M"
            
        }
        
        else {
            
            return "Something wrong"
        }
        
        
    }
    
    
    func showPercentChange() -> UIColor {
        
        let percent = self.percent_change_24h.toDouble()
        
        if percent > 0 {
            
            return .green
            
        }
        
        else  {
            
            return .red
        }
        
}
    
    func  numberFormatter(quote: String) -> String {
        
        var quoteParam = quote
        
        if quoteParam == available_supply {
            
            let quote = quoteParam.toInt()
            let formattedNumber = quote.formattedWithSeparator
            return formattedNumber

        }
        
        else if quoteParam == total_supply {
            
            let quote = quoteParam.toInt()
            let formattedNumber = quote.formattedWithSeparator
            return formattedNumber
            
        }
            
        else if quoteParam == dailyVolumeUSD {
            
            let quote = quoteParam.toInt()
            let formattedNumber = quote.formattedWithSeparator
            return formattedNumber
            
        }
        
        else {
            
            quoteParam = max_supply ?? "No Value"
            
            if quoteParam.isEmpty {
              
               return ""
            }
            
            else {
                
                let quote = quoteParam.toInt()
                let formattedNumber = quote.formattedWithSeparator
                return formattedNumber

            }
           
}
        
}
    
}
    



extension String {
    
    func toDouble() -> Double {
    
        let quoteParam = self as NSString
        return quoteParam.doubleValue
        
    }
        
    func toInt() -> Int {
            
            let quoteParam = self as NSString
            let myInt = quoteParam.integerValue
            return myInt
        }
    
    
}
    
extension Formatter {
    
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = " "
        formatter.numberStyle = .decimal
        return formatter
    }()
    
}
    extension Int {
        
        var formattedWithSeparator: String {
            return Formatter.withSeparator.string(for: self) ?? ""
        }
    }



