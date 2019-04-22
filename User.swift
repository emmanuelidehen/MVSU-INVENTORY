//
//  User.swift
//  MVSU Inventory App
//
//  Created by Emmanuel Idehen on 4/22/19.
//  Copyright © 2019 Emmanuel Idehen. All rights reserved.
//

import Foundation
import Foundation
import FirebaseDatabase.FIRDataSnapshot

class User {
    
    // MARK: - Properties
    
    let uid: String
    let username: String
    
    // MARK: - Init
    
    init(uid: String, username: String) {
        // i don't think this self are supposed to be here! 
        self.uid = uid
        self.username = username
    }
    
    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String : Any],
            let username = dict["username"] as? String
            else { return nil }
        
        self.uid = snapshot.key
        self.username = username
    }
}
