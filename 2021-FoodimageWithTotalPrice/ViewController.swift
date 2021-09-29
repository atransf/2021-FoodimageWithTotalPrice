//
//  ViewController.swift
//  2021-FoodimageWithTotalPrice
//
//  Created by Anh Tran on 9/28/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var itemNameAndPrice: UILabel!
    @IBOutlet weak var tipInput: UITextField!
    @IBOutlet weak var total: UILabel!
    
    var imageText = ""
    var imageIndex = 0
    var priceIndex = 0
    let dishName = ["pizza","salad","hamburger","pasta"]
    let priceList = [19.99,11.99,15.99,17.99]
    override func viewDidLoad() {
        super.viewDidLoad()
        tipInput.delegate = self
        let imageName = dishName[imageIndex]
        let itemPrice = priceList[priceIndex]
        imageView.image = UIImage(named: imageName)
        itemNameAndPrice.text = "\(imageName) price: $\(itemPrice)".capitalizingFirstLetter()
        imageText = imageName
        
    }

    @IBAction func nextDishButtonPressed(_ sender: UIButton) {
        if imageIndex < dishName.count-1 {
            imageIndex += 1
            priceIndex += 1
        } else {
            imageIndex = 0
            priceIndex = 0
        }
        
        let imageName = dishName[imageIndex]
        let itemPrice = priceList[priceIndex]
        imageView.image = UIImage(named: imageName)
        itemNameAndPrice.text = "\(imageName) price: $\(itemPrice)".capitalizingFirstLetter()
        imageText = imageName
    }
    
    @IBAction func orderDishButtonPressed(_ sender: UIButton) {
        let customerTip :Double? = Double(tipInput.text!)
        var foodPrice = 0.0
        var totalPrice = 0.0
        let myDishToOrder = imageText
        
        for index in 0 ..< dishName.count {
            if dishName[index] == myDishToOrder {
                foodPrice = priceList[index]
            }
        }
//        totalPrice = round((foodPrice + (foodPrice * (customerTip!/100)))*100) / 100.0
//        total.text = "Total Payment: $\(totalPrice)"
        
        totalPrice = foodPrice + (foodPrice * (customerTip!/100))
        total.text = "Total Payment: $" + String(format: "%.2f", totalPrice)
    }

}

    
extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

