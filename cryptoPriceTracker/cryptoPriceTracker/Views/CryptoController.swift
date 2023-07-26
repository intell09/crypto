//
//  CryptoController.swift
//  cryptoPriceTracker
//
//  Created by russell gadsden on 7/23/23.
//

import Foundation
import UIKit

class CryptoController {
    
    func getPrice(crpCcy: String, ccy: String, completion: @escaping (String) -> Void) {
            if let url = URL(string: "https://min-api.cryptocompare.com/data/price?fsym=BTC&tsyms=USD,JPY,EU" + crpCcy + "&tsysms=" + ccy){
                URLSession.shared.dataTask(with: url) { (data, response, error) in
                    if let data = data {
                        if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String:Double] {
                            if let price = json[ccy] {
                                let formatter = NumberFormatter()
                                formatter.currencyCode = ccy
                                formatter.numberStyle = .currency
                                let formattedPrice = formatter.string(from: NSNumber(value: price))
                                completion(formattedPrice ?? "")
                            }
                        }
                    } else {
                        print("Error fetching or parsing data.")
                    }
                }.resume()
            }
        }
    }


