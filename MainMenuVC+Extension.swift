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
    func product() -> String {
        return String(self)
    }
}





  var listOfPruductCategories: [String] = ["Long dress","Short dress","Books","Pant","Sweater","Greencaps","Other"]


extension MainMenuViewController: UITableViewDataSource {
   
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        
        let result = searchBar.text!
        let products = userProducts
        
        for i in products
        {
            if i.productName == result{
                
                /*
                //reload the tableview, only showing the item you searched for
                //you might have to load the tableview again, this time only giving it an arry of the item corresponsing to i */
                
                //  [self.tableView.reloadData()];
//                 userProducts.count
              
//                tableView.beginUpdates()
                
                  print("Item found")
                
            
                
                //print("Item found")
               // tableView.reloadData()
                
                
            }
            
           
        }
        
//        var arrray = [products]
//        arrray.append([ ])
//        tableView.dataSourceIndexPath(forPresentationIndexPath: )
//    // first.append(contentsOf: second)
//        func found(){
//
//
//            arrray.append(products)
//           // let indexpath = indexpath(row: arrray.count, section: 0)
//            tableView.beginUpdates()
//        }
        
       // tableView.reloadData()
        
    }
    
  
    
    
    // MARK:  DATA SOURCE METHODS
    
    // Function to keep track of the amount of cells in the main menu
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if tableView == resultController.tableView{
//            return filteredArray.count
//        }else {
//            return listOfPruductCategories.count
//        }
//        if isSearching{
//            return userProducts.count
//        }
       
       
        return userProducts.count
    }
    //===========================================================================================================
    // Function to fill up each table view cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.mainMenuCellIdentifier, for: indexPath) as! ProductCell
//        let text: Product!
//
//        if isSearching{
//            text = userProducts[indexPath.row]
//        }else{
//
//        }
        let product = userProducts[indexPath.row]
        
        cell.productNameLabel.text = product.productName
        cell.productProfitLabel.text = "$" + product.getProductProfit().convertDoubleToString()
        cell.productImage.image = product.productImage as? UIImage
        
       
        
       
       
        return cell
    }
   
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        if searchBar.text == nil || searchBar.text == "" {
//            isSearching = false
//            view.endEditing(true)
//            [self.tableView.reloadData()];
//        }else {
//            isSearching = true
//           // filteredArray = Data.filter( {ProductCell; searchbar.text})
//           [self.tableView.reloadData()];
//           // userProducts =
//        }
    }
    
   
    
    
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

