////
////  LoginViewController.swift
////  MVSU Inventory App
////
////  Created by Emmanuel Idehen on 4/21/19.
////  Copyright © 2019 Emmanuel Idehen. All rights reserved.
////
//
//import UIKit
////import FirebaseAuth
////import FirebaseUI
////import FirebaseDatabase
//
//typealias FIRUser = FirebaseAuth.User
//
//
//
//extension LoginViewController: FUIAuthDelegate {
//    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
//        
//        guard let user = authDataResult?.user
//            else { return }
//        
//        // 2
//        let userRef = Database.database().reference().child("users").child(user.uid)
//        
//        // 3
//        userRef.observeSingleEvent(of: .value, with: { [unowned self] (snapshot) in
//            if let user = User(snapshot: snapshot) {
//                User.setCurrent(user)
//                
//                let storyboard = UIStoryboard(name: "Main", bundle: .main)
//                if let initialViewController = storyboard.instantiateInitialViewController() {
//                    self.view.window?.rootViewController = initialViewController
//                    self.view.window?.makeKeyAndVisible()
//                }
//            } else {
//                self.performSegue(withIdentifier: "toCreateUsername", sender: self)
//            }
//        })
//        if let error = error {
//            assertionFailure("Error signing in: \(error.localizedDescription)")
//            return
//        }
//        
//        print("handle user signup / login")
//    }
//}
//
//
//
//
//
//
//class LoginViewController: UIViewController {
//
//    
//    @IBOutlet weak var loginButton: UIButton!
//    
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
//    
//    @IBAction func loginButtonTapped(_ sender: UIButton) {
//        
//        // 1
//        guard let authUI = FUIAuth.defaultAuthUI()
//            else { return }
//        
//        // 2
//        authUI.delegate = self
//        
//        // 3
//        let authViewController = authUI.authViewController()
//        present(authViewController, animated: true)
//        
//        print("Login button Tapped")
//    }
//    
//    
//    // MARK: - Navigation
//
//    //In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//        
//        
//    }
// 
//    
//    
//    
//
//}
//
//
//
