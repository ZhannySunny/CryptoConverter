//
//  QuoteCached.swift
//  CryptoConverter
//
//  Created by Zhaniya Zhukesheva on 25/10/2019.
//  Copyright © 2019 Zhaniya Zhukesheva. All rights reserved.
//

import Foundation
import RealmSwift

class QuoteCached: Object {
    
    @objc dynamic var id: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var symbol: String = ""
    @objc dynamic var rank: String = ""
    @objc dynamic var price_usd: String = ""
    @objc dynamic var price_btc: String = ""
    @objc dynamic var dailyVolumeUSD: String = ""
    @objc dynamic var market_cap_usd: String = ""
    @objc dynamic var available_supply: String = ""
    @objc dynamic var total_supply: String = ""
    @objc dynamic var max_supply: String? = ""
    @objc dynamic var percent_change_1h: String = ""
    @objc dynamic var percent_change_24h: String = ""
    @objc dynamic var percent_change_7d: String = ""
    @objc dynamic var last_updated: String? = ""
    
    override class func primaryKey() -> String? {
        return "id"
    
    }
    
    //MARK: Convertation 
    
    convenience init(quote: Quote) {
        
        self.init()
        
        id = quote.id
        name = quote.name
        symbol = quote.symbol
        rank = quote.rank
        price_usd = quote.price_usd
        price_btc = quote.price_btc
        dailyVolumeUSD = quote.dailyVolumeUSD
        market_cap_usd = quote.market_cap_usd
        available_supply = quote.available_supply ?? "No Value"
        total_supply = quote.total_supply ?? "No Value"
        max_supply = quote.max_supply
        percent_change_1h = quote.percent_change_1h
        percent_change_7d = quote.percent_change_7d
        percent_change_24h = quote.percent_change_24h
        last_updated = quote.last_updated
    
        
    }
    
    
}
    
    
    
    
    


