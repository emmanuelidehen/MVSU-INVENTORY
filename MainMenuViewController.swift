//
//  MainMenuViewController.swift
//  MVSU Inventory App
//

//

import UIKit
import Foundation


class MainMenuViewController: UIViewController{
    
    // MARK: @IBOULETS
    @IBOutlet weak var tableView: UITableView!
    
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

