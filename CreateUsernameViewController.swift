//
//  CreateUsernameViewController.swift
//  MVSU Inventory App
//
//  Created by Emmanuel Idehen on 4/22/19.
//  Copyright © 2019 Emmanuel Idehen. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class CreateUsernameViewController: UIViewController {

   
    @IBOutlet weak var usernameTextField: UITextField!
    
    
    @IBOutlet weak var nextButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.layer.cornerRadius = 6
        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        
        // 1
        guard let firUser = Auth.auth().currentUser,
            let username = usernameTextField.text,
            !username.isEmpty else { return }
        
        UserService.create(firUser, username: username) { (user) in
            guard let _ = user else {
                return
            }
            
            let storyboard = UIStoryboard(name: "Main", bundle: .main)
            
            if let initialViewController = storyboard.instantiateInitialViewController() {
                self.view.window?.rootViewController = initialViewController
                self.view.window?.makeKeyAndVisible()
            }
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
