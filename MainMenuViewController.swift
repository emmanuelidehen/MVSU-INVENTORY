//
//  MainMenuViewController.swift
//  MVSU Inventory App
//

//

import UIKit
import Foundation


class MainMenuViewController: UIViewController, UISearchResultsUpdating{
     var searchController = UISearchController()
    var resultController = UITableViewController()
   var listOfPruductCategories = ["Book","Sweater","Long Dress","Short Dress","Pant"]
    var filteredArray = [String]()
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
        
        searchController = UISearchController(searchResultsController: resultController)
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchResultsUpdater = self
        
        resultController.tableView.delegate = self
        resultController.tableView.dataSource = self
    }
    
    
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
    
    
    //Binary Search Algorithm
    // inteand to use this alorithm to serach for items in the list
    func binarySearch ( inputSortedData: [Int], searchElement: Int ) -> Int {
        var minLeft = 0
        var maxRight = inputSortedData.count - 1
        while ( minLeft <= maxRight ) {
            let middleElement = (minLeft + maxRight) / 2
            if (searchElement == inputSortedData[middleElement]) { return middleElement + 1; }
            if (searchElement < inputSortedData[middleElement]) { maxRight = middleElement - 1 }
            if (searchElement > inputSortedData[middleElement]) { minLeft = middleElement + 1 }
        }
        return -1;
    
}
    
 
    
    
    
    
}

