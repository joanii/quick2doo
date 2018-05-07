//
//  Constants.swift
//  quick2doo
//
//  Created by Joan Disho on 13.10.17.
//  Copyright © 2017 Joan Disho. All rights reserved.
//

import UIKit

struct Constants {
    
    struct Realm {
        private static let documentsDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        static let localRealmURL = URL(fileURLWithPath: Constants.Realm.documentsDirectory.appending("/local.realm"))
    }
    
    struct Color {
        static let navbar = UIColor(red: 70.0/255.0, green: 98.0/255.0, blue: 108.0/255.0, alpha: 1.0)
        static let darkBG = UIColor(red: 25.0/255.0, green: 52.0/255.0, blue: 65.0/255.0, alpha: 1.0)
        static let overlay = UIColor(red: 19.0/255.0, green: 44.0/255.0, blue: 58.0/255.0, alpha: 1.0)
        static let redZ = UIColor(red: 174.0/255.0, green: 32.0/255.0, blue: 10.0/255.0, alpha: 1.0)
        static let blackZ = UIColor(red: 13.0/255.0, green: 34.0/255.0, blue: 47.0/255.0, alpha: 1.0)
        static let yellowZ = UIColor(red: 252.0/255.0, green: 197.0/255.0, blue: 6.0/255.0, alpha: 1.0)
        static let green = UIColor(red: 76.0/255.0, green: 217.0/255.0, blue: 100.0/255.0, alpha: 1.0)
        static let flatLightGrey = UIColor(red: 127.0/255.0, green: 128.0/255.0, blue: 128.0/255.0, alpha: 1.0)
        static let textWhite = UIColor.white
        static let textDark = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        static let textLight = UIColor(red: 138.0/255.0, green: 138.0/255.0, blue: 139.0/255.0, alpha: 1.0)
        static let textMedium = UIColor(red: 127.0/255.0, green: 128.0/255.0, blue: 129.0/255.0, alpha: 1.0)
        static let seperator = UIColor(red: 200.0/255.0, green: 202.0/255.0, blue: 203.0/255.0, alpha: 1.0)
        static let redZHighlighted = UIColor(red: 128.0/255.0, green: 24.0/255.0, blue: 8.0/255.0, alpha: 1.0)
    }
}

