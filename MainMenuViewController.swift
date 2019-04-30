//
//  MainMenuViewController.swift
//  MVSU Inventory App
//

//

import UIKit
import Foundation



class MainMenuViewController: UIViewController {
    var searchController = UISearchController()
    var resultController = UITableViewController()
//    var listOfPruductCategories: [String] = ["long dress","short dress","books","pant","sweater","greencaps","bags","other"]
    var filteredArray = [String]()
//  var listOfPruductCategories: [String] = ["long dress","short dress","books","pant","sweater","greencaps","other"]
    
   
    
    
    
    // MARK: @IBOULETS
    @IBOutlet weak var tableView: UITableView!
    //added a search bar to the main
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    // MARK: PROPERTIES
    
    var userProducts = [Product]() {
        didSet {
            tableView.reloadData()
        }
    }
    
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
//        searchController = UISearchController(searchResultsController: resultController)
//        tableView.tableHeaderView = searchController.searchBar
      //  searchController.searchResultsUpdater = self
        
        resultController.tableView.delegate = self
        resultController.tableView.dataSource = self
       // searchBar.delegate! = self
       // searchBar.returnKeyType = UIReturnKeyType.done
    }
    
    
    
   
    
//    //UPDate search result
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
        //filteredArray = Array.filter({Array<<<error; type>>>})
        //    if Array.contains(searchController.searchBar.text!){
        //     return true

        
        
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

