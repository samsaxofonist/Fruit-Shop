//
//  NewControllerViewController.swift
//  1.05.18
//
//  Created by Dima on 10.05.2018.
//  Copyright © 2018 Samus Dimitriy. All rights reserved.
//

import UIKit

class NewControllerViewController: UIViewController {

    var categoryName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let finishBlock: ((Data?, URLResponse?, Error?) -> Void) = { data, response, error in
            guard error == nil else {
                let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return
                
            }
           
            DispatchQueue.main.async {
                //self.tableView.reloadData()
            }
            
        }
        let serverAdress: String = "http://api.predic8.de/shop/categories/\(categoryName)"
        if let myUrl = URL(string: serverAdress) {
            let request = URLSession.shared.dataTask(with: myUrl, completionHandler: finishBlock)
            request.resume()
            
        }
    }

}
