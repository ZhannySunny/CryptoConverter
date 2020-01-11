//
//  ViewController.swift
//  CryptoConverter
//
//  Created by Zhaniya Zhukesheva on 27/08/2019.
//  Copyright © 2019 Zhaniya Zhukesheva. All rights reserved.
//

import UIKit
import Foundation

class DetailedViewController: UIViewController {
    
    
    @IBOutlet weak var quoteDetailImgView: UIImageView!
    @IBOutlet weak var quoteNameLabel: UILabel!
    @IBOutlet weak var quoteID: UILabel!
    @IBOutlet weak var quoteSymbol: UILabel!
    @IBOutlet weak var quoteRank: UILabel!
    @IBOutlet weak var priceUSD: UILabel!
    @IBOutlet weak var priceBTC: UILabel!
    @IBOutlet weak var dayVolUSD: UILabel!
    @IBOutlet weak var marketCapUSD: UILabel!
    @IBOutlet weak var avSupply: UILabel!
    @IBOutlet weak var totalSupply: UILabel!
    @IBOutlet weak var maxSupply: UILabel!
    @IBOutlet weak var percentChg1h: UILabel!
    @IBOutlet weak var percentChngIn24h: UILabel!
    @IBOutlet weak var dayPersChng: UILabel!
    @IBOutlet weak var lastUpd: UILabel!
    
    var passedQuote: Quote?
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        quoteDetailImgView.layer.masksToBounds = true
        quoteDetailImgView.layer.cornerRadius = quoteDetailImgView.bounds.width / 2
        
        
        if let quote = self.passedQuote {
            
            self.title = quote.name
            quoteDetailImgView.image = UIImage(named: quote.image)
            
            quoteNameLabel.text = quote.name
            quoteID.text = quote.id
            quoteSymbol.text = quote.symbol
            quoteRank.text = quote.rank
            priceUSD.text = String(format:"%.2f", quote.price_usd.toDouble()) + " $"
            priceBTC.text = String(format:"%.3f", quote.price_btc.toDouble()) + " BTC"
            dayVolUSD.text = quote.numberFormatter(quote: quote.dailyVolumeUSD) + " $"
            marketCapUSD.text = quote.formattedBillion()
            avSupply.text = quote.numberFormatter(quote: quote.available_supply ?? "No Value")
            
            
            //let result = String(format: "%ld %@", locale: Locale.current, viewCount, "views")
            
            totalSupply.text = quote.numberFormatter(quote: quote.total_supply ?? "No Value")
            maxSupply.text = quote.numberFormatter(quote: quote.max_supply ?? "No value")
            percentChg1h.text = quote.percent_change_1h + " %"
            percentChngIn24h.text = quote.percent_change_24h + " %"
            dayPersChng.text = quote.percent_change_7d + " %"
            
            
        }
            
            let dateFormatter = DateFormatter()
            dateFormatter.timeZone = .current
            dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
            let date = Date()
            lastUpd.text = dateFormatter.string(from: date)
        }
    
    }
    
    
 



    
    


