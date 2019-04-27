//
//  MainMenuVC+Extension.swift
//  MVSU Inventory App
//
//  Created by Emmanuel Idehen on 4/13/18.
//  Copyright © 2018 Emmanuel Idehen. All rights reserved.
//

import Foundation
import UIKit

extension String {
    func toString() -> String {
        return String(self)
    }
}




extension MainMenuViewController: UITableViewDataSource, UITableViewDelegate{
   
            // MARK:  DATA SOURCE METHODS
    
    // Function to keep track of the amount of cells in the main menu
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == resultController.tableView{
            return filteredArray.count
        }else {
            return listOfPruductCategories.count
        }
       // return userProducts.count
    }
    //===========================================================================================================
    // Function to fill up each table view cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.mainMenuCellIdentifier, for: indexPath) as! ProductCell
        let product = userProducts[indexPath.row]
        cell.productNameLabel.text = product.productName
        cell.productProfitLabel.text = "$" + product.getProductProfit().convertDoubleToString()
        cell.productImage.image = product.productImage as? UIImage
//
//        //if statement to check if the search result is equal to the
//       if tableView == resultController.tableView{
//           cell.productNameLabel?.text = filteredArray[indexPath.row]
//            cell.textLabel?.text = filteredArray[indexPath.row]
//     //   cell.productImage?.textInputMode = filteredArray[indexPath.row]
//          //  cell.productProfitLabel?.text = filteredArray[indexPath.row]
//
////          //  return filteredArray.count
//       }else {
//              cell.textLabel?.text = listOfPruductCategories[indexPath.row]
//       //    return listOfPruductCategories.count
//
//        }
//
//
        if tableView == resultController.tableView{
        
            
        }else {
      
        }
        return cell
    }
    //==========================================================================================================
    
    // function to remove a product from the main menu and from the array
    func tableView(_ tableview : UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
                // gets the product to remove, deletes it, then updates the list
            let productToBeDeleted = userProducts[indexPath.row]
            CoreDataHelper.deleteProductFromTheInventory(productToBeDeleted)
            userProducts = CoreDataHelper.fetchAllProducts()
        }
    }
    
    
    
}

