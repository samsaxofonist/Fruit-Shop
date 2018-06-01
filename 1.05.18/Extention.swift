//
//  Extention.swift
//  15.05.18
//
//  Created by Andrii Kravchenko on 31.05.18.
//  Copyright © 2018 Samus Dimitriy. All rights reserved.
//

import UIKit

extension UIViewController {
    func error() {
        let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
