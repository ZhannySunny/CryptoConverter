//
//  ConverterViewController.swift
//  CryptoConverter
//
//  Created by Zhaniya Zhukesheva on 13/09/2019.
//  Copyright © 2019 Zhaniya Zhukesheva. All rights reserved.
//

import UIKit
import SwiftySound

class ConverterViewController: UIViewController {
    
    
    var firstQuote: Quote?
    var secondQuote: Quote?
    var quantity: Double = 0.0
    
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    
    @IBOutlet weak var clearTextFields: UIButton!
    
    
    @IBOutlet weak var baseQuoteSelected: UIButton!
    @IBOutlet weak var convertQuoteSelected: UIButton!
    
    
    @IBOutlet weak var baseQuoteLabel: UILabel!
    @IBOutlet weak var convertQuoteLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clearTextFields.isHidden = true

        NotificationCenter.default.addObserver(self, selector: #selector(changeFirstQuote),
                                               name: Notificator.firstQuoteNameNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(changeSecondQuote),
                                               name: Notificator.secondQuoteNameNotification,
                                               object: nil)

        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
        
    }
    
    @objc func changeFirstQuote(notification: Notification) {
        
        if let object = notification.object {
            
            if let quote = object as? Quote {
                
                firstQuote = quote
                playSound()
                baseQuoteSelected.setImage(UIImage(named: quote.image), for: .normal)
                baseQuoteLabel.text = quote.name
                
            }
        }
    }

    @objc func changeSecondQuote(notification: Notification) {
        
        if let object = notification.object {
            
            if let quote = object as? Quote {
                
                secondQuote = quote
                playSound()
                convertQuoteSelected.setImage(UIImage(named: quote.image), for: .normal)
                convertQuoteLabel.text = quote.name
            }
        }
    }

    @objc func changeImage(notification:Notification) {
        
        if let object = notification.object  {
            
            if let image = object as? String {
            
                baseQuoteSelected.setImage(UIImage(named: image), for: .normal)
                
            }
            
        }
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let controller = segue.destination as? CryptoTableViewController
            
            else {
            return
        }
        
        if segue.identifier == "firstQuote" {
            controller.quoteType = .firstQuote
        }
        
        if segue.identifier == "secondQuote" {
            controller.quoteType = .secondQuote
        }
    }
    
    @IBAction func editingChanged1(_ sender: Any) {
        
        guard let text = firstTextField.text, let value = Double(text) else {
            return
        }
        
        guard let quote1 = firstQuote, let quote2 = secondQuote else {
            return
        }
        
        let convertedValue = Double(quote1.price_usd)! * value / Double(quote2.price_usd)!
        
        secondTextField.text = String(format: "%.3f",convertedValue)
        
        clearTextFields.isHidden = false
        
    }

    @IBAction func editingChanged2(_ sender: Any) {
        
        guard let text = secondTextField.text, let value = Double(text) else {
            return
        }
        
        guard let quote1 = secondQuote, let quote2 = firstQuote else {
            return
        }
        
        let convertedValue = Double(quote1.price_usd)! * value / Double(quote2.price_usd)!
        firstTextField.text = String(format: "%.3f", convertedValue)
        
        clearTextFields.isHidden = false 
        
    }
    
    
    @IBAction func clearTxtFields(_ sender: UIButton) {
        
        firstTextField.text = ""
        secondTextField.text = ""
        
    }
    
    
    func playSound() {
        
        if let soundURL = Bundle.main.url(forResource: "fourth", withExtension: "wav") {
            
            Sound.play(url: soundURL)
            
        }
    }
    
    
}
