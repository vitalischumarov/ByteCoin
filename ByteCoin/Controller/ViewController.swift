//
//  ViewController.swift
//  ByteCoin
//
//  Created by Vitali Schumarov on 15.05.23.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var bitcoinLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    var coinManager = CoinManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyPicker.delegate = self
        coinManager.delegate = self
    }
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate  {
//    how many columns should be displayed
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        print("function pickerView was called")
//        currencyLabel.text = coinManager.currencyArray[row]
//        coinManager.fetchURL(currencyName: coinManager.currencyArray[row])
//        return coinManager.currencyArray[row]
          return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currencyLabel.text = coinManager.currencyArray[row]
        coinManager.fetchURL(currencyName: coinManager.currencyArray[row])
    }
    
}

extension ViewController: CoinProtocol {
    func getPrice(value: Double) {
        DispatchQueue.main.async {
            self.bitcoinLabel.text = String(format: "%.0f", value)
        }
    }
    
    
}
