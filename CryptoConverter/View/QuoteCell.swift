//
//  QuoteCell.swift
//  CryptoConverter
//
//  Created by Zhaniya Zhukesheva on 03/09/2019.
//  Copyright © 2019 Zhaniya Zhukesheva. All rights reserved.
//

import UIKit


class QuoteCell: UITableViewCell {
    
    
    @IBOutlet weak var quoteImage: UIImageView!
    
    @IBOutlet weak var quoteLbl: UILabel!
    
    @IBOutlet weak var quoteSymbol: UILabel!
    
    @IBOutlet weak var quoteRank: UILabel!
    
    @IBOutlet weak var quotePrice: UILabel!
    
    @IBOutlet weak var quoteChange: UILabel!
    
    @IBOutlet weak var quoteMarketCap: UILabel!
    
    @IBOutlet weak var quoteDifference: UILabel!
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    
    }


    
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
//
//    func setQuote(quote: Quote) {
//
//        quoteLbl.text =  quote.name
//        quoteImage.image = UIImage(named: quote.image)
//        quoteSymbol.text = quote.symbol
//        quoteRank.text = "Rank: " + (String(quote.rank))
//        quotePrice.text = String(format: "%.3f",(quote.price_usd)) + " $"
//
//    }

}



