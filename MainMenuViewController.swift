//
//  MainMenuViewController.swift
//  MVSU Inventory App
//

//

import UIKit
import Foundation



class MainMenuViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate {
   
    
    var searchbar = UISearchBar()
    var resultController = UITableViewController()
  
    
   
    var isSearching = false
    
    
    // MARK: @IBOULETS
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    // MARK: PROPERTIES
    
    var userProducts = [Product]() {
        didSet {
            tableView.reloadData()
        }
    }
    
      var filteredArray = [String]()
  
    
    // MARK: @IBACTIONS
    @IBAction func unwindWithSegue(_ segue: UIStoryboardSegue){
        userProducts = CoreDataHelper.fetchAllProducts()
    }
    
    // MARK: VIEW CONTROLLER LIFECYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self as UITableViewDelegate
        tableView.dataSource = self as UITableViewDataSource
        tableView.separatorColor = UIColor.white
        userProducts = CoreDataHelper.fetchAllProducts()
        //search alg...
   
        
        searchbar.delegate = self
        searchbar.returnKeyType = UIReturnKeyType.done
        
        resultController.tableView.delegate = self
        resultController.tableView.dataSource = self
    }
    
    
    
   
    
    //UPDate search result
    func updateSearchResults(for searchController: UISearchController) {
        filteredArray = listOfPruductCategories.filter({ (listOfPruductCategories:String) -> Bool in
            if listOfPruductCategories.contains(searchController.searchBar.text!){
                return true
            }else
            {
                return false
            }
        })
        resultController.tableView.reloadData()



       // if
    }

    // MARK: SEGUES METHODS
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {return}
        
        switch identifier{
        case "showProduct":
            
            guard let indexPath = tableView.indexPathForSelectedRow else {return}
            let product = userProducts[indexPath.row]
            let destination = segue.destination as! ShowProductViewController
            destination.product = product
            
        case "addProduct":
            print("adding product")
        default:
            print("Unverified identifier")
        }
    }
    
    
    
    
    
    
    
}

