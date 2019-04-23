//
//  ShowProductViewController.swift
//  MVSU Inventory App
//
//  Created by Emmanuel Idehen on 3/30/18.
//  Copyright © 2018 Emmanuel Idehen. All rights reserved.
//

import UIKit
import Foundation


/*
 This is where the user creates, modifies, and enters the data for each product 
 */
class ShowProductViewController: UIViewController {
    
    // MARK: PROPERTIES
    var product: Product?
    let listOfPruductCategories: [String] = ["Long Dress","Short Dress","Books","Pant","sweater","greencaps","bags","Other"]
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        switch pickerValue{
        case "Long Dress":
                productImage = UIImage(named: "longDress")
        case "Short Dress":
                productImage = UIImage(named: "shortDress")
        case "Pant":
                productImage = UIImage(named: "pants")
        case "Books":
                productImage = UIImage(named: "Books")
        case "sweater":
                productImage = UIImage(named: "sweater")
        case "Other":
                productImage = UIImage(named: "mvsu")
        case "greencaps":
            productImage = UIImage(named: "greencaps")
        case "bags":
            productImage = UIImage(named: "bags")
       default:
            productImage = UIImage(named: "noImage")
    
        }
    
        return productImage!
    }
}
