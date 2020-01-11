//
//  CryptoTableViewController.swift
//  CryptoConverter
//
//  Created by Zhaniya Zhukesheva on 02/09/2019.
//  Copyright © 2019 Zhaniya Zhukesheva. All rights reserved.
//

import UIKit
import AnimatableReload
import SwiftySound


class CryptoTableViewController: UITableViewController {
    
    private var quoteProvider = QuoteProvider()
    private var realm = RealmService()
    private var quotes = [Quote]()
    private var buttonClick: Sound?
    
    enum SelectedQuote {
        case noQuote
        case firstQuote
        case secondQuote
    }

    var quoteType: SelectedQuote = .noQuote
    
    override func viewDidLoad() {

        super.viewDidLoad()

//        revealSplashView.animationType = .heartBeat
//        revealSplashView.duration = 2.0
//        view.addSubview(revealSplashView)
//        revealSplashView.startAnimation()
        
        NotificationCenter.default.addObserver(self, selector: #selector(getQuotes), name: Notificator.getQuotesNotification, object: nil)
        
        
        if let quotes = realm.readQuotes(), quotes.count != 0 {
            self.quotes = quotes
        }
            
        else {
            quoteProvider.loadQuotesData()
        }

    }

    //MARK: Get quotes through Notification
    
    @objc func getQuotes(notification: Notification) {
            
            if let receivedQuotes = notification.object as? [Quote] {
                
                self.quotes = receivedQuotes
                realm.writeQuotes(quotes: quotes)
                AnimatableReload.reload(tableView: tableView, animationDirection: "up")
                
            }
    }



    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 88
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return quotes.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let quote = quotes[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "QuoteCell", for: indexPath) as? QuoteCell {
            
            
            cell.quoteLbl.text = quote.name
            cell.quoteSymbol.text = quote.symbol
            cell.quoteRank.text = quote.rank
            cell.quotePrice.text = String(format:"%.2f", quote.price_usd.toDouble()) + " $"
            
            cell.quoteChange.text = quote.percent_change_24h + "%"
            cell.quoteChange.textColor = quote.showPercentChange()
            
            cell.quoteMarketCap.text = quote.formattedBillion() 
                
                //"$" + quote.market_cap_usd
            
            //cell.backgroundColor = UIColor(r: 22, g: 57, b: 79)
            cell.quoteImage.clipsToBounds = true
            cell.quoteImage.layer.cornerRadius = cell.quoteImage.frame.width / 2
            
            cell.quoteImage.image = UIImage(named: quote.image)
            
            
            return cell
        }
        
         return UITableViewCell()
        
        }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let detailVC = segue.destination as? DetailedViewController {
            
            if let indexPath = tableView.indexPathForSelectedRow {
                
                let quote = quotes[indexPath.row]
                detailVC.passedQuote = quote
                
                if quoteType != .noQuote {
                    dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch quoteType {
            
        case .firstQuote:
            NotificationCenter.default.post(name: Notificator.firstQuoteNameNotification, object: quotes[indexPath.row])
            dismiss(animated: true, completion: nil)

        case .secondQuote:
            NotificationCenter.default.post(name: Notificator.secondQuoteNameNotification, object: quotes[indexPath.row])
            dismiss(animated: true, completion: nil)
            
        case .noQuote:
            print("do nothing")
        }
    }
    
    
    @IBAction func updateQuotes(_ sender: UIBarButtonItem) {
        
        playSound()
        quoteProvider.loadQuotesData()
        
    }
    
    func playSound() {
        
        if let soundURL = Bundle.main.url(forResource: "second", withExtension: "wav") {
            
            Sound.play(url: soundURL)

        }
    }

}

//let myString = "556"
//let myFloat = (myString as NSString).doubleValue

