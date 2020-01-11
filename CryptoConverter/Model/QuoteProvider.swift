//
//  QuoteProvider.swift
//  CryptoConverter
//
//  Created by Zhaniya Zhukesheva on 02/09/2019.
//  Copyright © 2019 Zhaniya Zhukesheva. All rights reserved.
//

import Foundation

class QuoteProvider {
    
    func loadQuotesData() {
        
        guard let url = URL(string: "https://api.coinmarketcap.com/v1/ticker/") else {
            
            print("Wrong URL")
            return
        }
        
        
        let dataTask = URLSession.shared.dataTask(with: url) {
            
            (data, response, error) in
            
            if let jsonData = data,
                
                let quotes = try? JSONDecoder().decode([Quote].self, from: jsonData) {
                
                DispatchQueue.main.async {
                    
                    NotificationCenter.default.post(name: Notificator.getQuotesNotification,
                                                    object: quotes)
                }
                
            }
        }
        
        dataTask.resume()
        
    }
    
}


