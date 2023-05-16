//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Vitali Schumarov on 15.05.23.
//

import Foundation

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "773CB6E0-1BB5-4989-A717-D75FDC5139E0"
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func fetchURL(currencyName: String) {
        let urlString = ("\(baseURL)/\(currencyName)?apikey=\(apiKey)")
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if (error != nil) {
                    print("Error message: \(error)")
                } else {
                    let dataString = String(data: data!, encoding: .utf8)
                    print(dataString)
                    }
            }
            task.resume()
        }
    }
}
