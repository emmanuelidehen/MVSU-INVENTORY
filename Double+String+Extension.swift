//
//  Double+String+Extension.swift
//  MVSU Inventory App
//
//  Created by Emmanuel Idehen on 4/5/18.
//  Copyright © 2018 Emmanuel Idehen. All rights reserved.
//

import Foundation
import UIKit

extension Double{
    func convertDoubleToString() -> String{
        return String(self)
    }
}

extension String{
    func convertSringToDouble(_ stringValue: String?) -> Double?{
        guard let stringToBeDouble = stringValue else {
            return nil
        }
        return Double(stringToBeDouble)
    }
}
