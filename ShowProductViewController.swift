//
//  ShowProductViewController.swift
//  MVSU Inventory App
//
//  Created by Emmanuel Idehen on 3/30/18.
//  Copyright © 2018 Emmanuel Idehen. All rights reserved.
//

import UIKit
import Foundation
//static cast from int to string 
extension Int16 {
    func toString() -> String {
        return String(self)
    }
}
/*
 This is where the user creates, modifies, and enters the data for each product 
 */
class ShowProductViewController: UIViewController {
    var tapInt = Int()
    
    
  
    // MARK: PROPERTIES
    var product: Product?
    let listOfPruductCategories: [String] = ["Long Dress","Short Dress","Books","Pant","sweater","greencaps","bags","Other","Linear Algebra","Discrete Mathematics","Intro. to Computation","iOS Programming","Pencil","Pen"]
    var pickerView = UIPickerView() // will hold all the product category choices
    
    // MARK:  @IBOULETS
    @IBOutlet weak var productNameLabel: UITextField!
    @IBOutlet weak var productBrandLabel: UITextField!
    @IBOutlet weak var productSizeLabel: UITextField!
    @IBOutlet weak var wholesalePriceLabel: UITextField!
    @IBOutlet weak var amazonPriceLabel: UITextField!
    @IBOutlet weak var sellingPriceLabel: UITextField!
    @IBOutlet weak var productCategoryLabel: UITextField!
    
    // MARK: VIEWCONTROLLERS LIFECYCLE METHODS
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var tapMe: UIButton!
    @IBOutlet weak var tapMex: UIButton!
    
    @IBOutlet weak var displayScoreLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tapInt = 0
        displayScoreLabel.text = String(tapInt)
        if self.product != nil {
            self.displayScoreLabel.text = self.product?.productAmount.toString()
        }
        
        
        
        
        
        self.title = product?.productName
        self.pickerView.delegate = self as UIPickerViewDelegate
        self.pickerView.dataSource = self as UIPickerViewDataSource
        productCategoryLabel.inputView = pickerView
        self.productNameLabel.delegate = self as UITextFieldDelegate
        self.productSizeLabel.delegate = self as UITextFieldDelegate
        self.productCategoryLabel.delegate = self as UITextFieldDelegate
        self.productBrandLabel.delegate = self as UITextFieldDelegate
        self.wholesalePriceLabel.delegate = self as UITextFieldDelegate
        self.amazonPriceLabel.delegate = self as UITextFieldDelegate
        self.sellingPriceLabel.delegate = self as UITextFieldDelegate
    }
    
    
    @IBAction func tapMeButton(_ sender: UIButton) {
        
        //guard let unwrappedProduct = self.product else { return }
        tapInt += 1
        self.displayScoreLabel.text = String(tapInt)
        //unwrappedProduct.productAmount += 1
//        self.product?.productAmount
//         displayScoreLabel.text = String(tapInt)
       
    }
  
    
    @IBAction func tapMeButtonx(_ sender: UIButton) {
        tapInt -= 1
        self.displayScoreLabel.text = String(tapInt)
//        self.product?.productAmount-=1
//        displayScoreLabel.text = String(tapInt)
      // UIAccessibilityTraitLink
        
    }
   
    override  func show(_ vc: UIViewController, sender: Any?) {
        displayScoreLabel.text = String(tapInt)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let product = product{
            productNameLabel.text = product.productName
            productBrandLabel.text = product.productBrand
            productSizeLabel.text = product.productSize
            productCategoryLabel.text = product.productCategory
            wholesalePriceLabel.text = product.productWholeSalePrice.convertDoubleToString()
            amazonPriceLabel.text = product.productPriceOnAmazon.convertDoubleToString()
            sellingPriceLabel.text = product.sellingPrice.convertDoubleToString()
 
        }else{
            productNameLabel.text = ""
            productCategoryLabel.text = ""
            productSizeLabel.text = ""
            productBrandLabel.text = ""
            wholesalePriceLabel.text = ""
            amazonPriceLabel.text = ""
            sellingPriceLabel.text = ""
        }
 
    }
 
    // MARK: CLASS METHODS

    internal func setProductImage(_ product: Product) -> UIImage{

        var productImage: UIImage?
                // Assigning the correct image to the product
        let pickerValue = listOfPruductCategories[pickerView.selectedRow(inComponent: 0)]
       
       // String.self; mount = 0;
        switch pickerValue{
        case "Long Dress":
          var tapInt: [String: Int] = [:]
      
            listOfPruductCategories.forEach { tapInt[$0, default: 0] += 1 }
            
            print(tapInt)
            
            productImage = UIImage(named: "longDress")
            
        case "Short Dress":
            var counts: [String: Int] = [:]
            
            listOfPruductCategories.forEach { counts[$0, default: 0] += 1 }
            
            print(counts)
                productImage = UIImage(named: "shortDress")
        case "Pant":
            var counts: [String: Int] = [:]
            
            listOfPruductCategories.forEach { counts[$0, default: 0] += 1 }
            
            print(counts)
                productImage = UIImage(named: "pants")
        case "Books":
            var counts: [String: Int] = [:]
            
            listOfPruductCategories.forEach { counts[$0, default: 0] += 1 }
            
            print(counts)
                productImage = UIImage(named: "Books")
            
        case "sweater":
            var counts: [String: Int] = [:]
            
            listOfPruductCategories.forEach { counts[$0, default: 0] += 1 }
            
            print(counts)
                productImage = UIImage(named: "sweater")
        case "Other":
            var counts: [String: Int] = [:]
            
            listOfPruductCategories.forEach { counts[$0, default: 0] += 1 }
            
            print(counts)
                productImage = UIImage(named: "mvsu")
        case "greencaps":
            var counts: [String: Int] = [:]
            
            listOfPruductCategories.forEach { counts[$0, default: 0] += 1 }
            
            print(counts)
            productImage = UIImage(named: "greencaps")
        case "bags":
            var counts: [String: Int] = [:]
            
            listOfPruductCategories.forEach { counts[$0, default: 0] += 1 }
            
            print(counts)
            productImage = UIImage(named: "bags")
            
        case "Linear Algebra":
            var counts: [String: Int] = [:]
            
            listOfPruductCategories.forEach { counts[$0, default: 0] += 1 }
            
            print(counts)
            productImage = UIImage(named: "Linear Algebra")
            
        case "Discrete Mathematics":
            var counts: [String: Int] = [:]
            
            listOfPruductCategories.forEach { counts[$0, default: 0] += 1 }
            
            print(counts)
            productImage = UIImage(named: "Discrete Mathematics")
        case "Intro. to Computation":
            var counts: [String: Int] = [:]
            
            listOfPruductCategories.forEach { counts[$0, default: 0] += 1 }
            
            print(counts)
            productImage = UIImage(named: "Intro. to Computation")
        case "iOS Programming":
            var counts: [String: Int] = [:]
            
            listOfPruductCategories.forEach { counts[$0, default: 0] += 1 }
            
            print(counts)
            productImage = UIImage(named: "iOS Programming")
        case "Pencil":
            var counts: [String: Int] = [:]
            
            listOfPruductCategories.forEach { counts[$0, default: 0] += 1 }
            
            print(counts)
            productImage = UIImage(named: "Pencil")
        case "Pen":
            var counts: [String: Int] = [:]
            
            listOfPruductCategories.forEach { counts[$0, default: 0] += 1 }
            
            print(counts)
            productImage = UIImage(named: "Pen")
            
            
            
            
        default:
            productImage = UIImage(named: "noImage")
    
        }
    
        return productImage!
    }
}
