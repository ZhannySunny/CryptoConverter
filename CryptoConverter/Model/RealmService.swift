//
//  RealmService.swift
//  CryptoConverter
//
//  Created by Zhaniya Zhukesheva on 25/10/2019.
//  Copyright © 2019 Zhaniya Zhukesheva. All rights reserved.
//

import Foundation
import RealmSwift

class RealmService {
    
    //MARK: Read data from Realm

func readQuotes() -> [Quote]? {
    
    print("Start to read quotes from Realm Database.")
        
        do {
            
            print("Start ")
            let realm = try Realm()
            return realm.objects(QuoteCached.self).map{Quote(from: $0)} as [Quote]
        }
        
        catch {
            
        print("Error! Cannot read data from Realm, \(error.localizedDescription)")
            
        }
        
        return nil
    }


    //MARK: Write data to Realm

func writeQuotes(quotes: [Quote]) {
    
    print("Start to write quotes to Ream Database")
    
    quotes.map{QuoteCached(quote: $0)}.forEach {
        
        quote in
        
        do {
            
            let realm = try Realm()
            try realm.write ({
                
                realm.add(quote, update: .modified)
            })
        }
            
        catch {
            
          print("Error! Cannot write data to Realm Database, \(error.localizedDescription)")
            
        }
    }
}
    
}

