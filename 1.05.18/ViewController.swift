//
//  ViewController.swift
//  1.05.18
//
//  Created by Dima on 01.05.2018.
//  Copyright © 2018 Samus Dimitriy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var categoriesNames: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let finishBlock: ((Data?, URLResponse?, Error?) -> Void) = { data, response, error in
            guard error == nil else {
                let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return
                
            }
            guard let validData = data else {return}
            guard let json = try? JSONSerialization.jsonObject(with: validData, options: []) else {return}
            guard let dict = json as? [String: Any] else {return}
            guard let categories = dict["categories"] as? [[String: Any]] else {return}
            for catDict in categories {
                let catKey = catDict["name"] as! String
                self.categoriesNames.append(catKey)
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
        let serverAdress: String = "http://api.predic8.de/shop/categories/"
        if let myUrl = URL(string: serverAdress) {
        let request = URLSession.shared.dataTask(with: myUrl, completionHandler: finishBlock)
        request.resume()
    
    }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoriesNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MyCell = self.tableView.dequeueReusableCell(withIdentifier: "firstCell") as! MyCell
        let nameOfCategories = categoriesNames[indexPath.row]
        cell.nameLabel.text = nameOfCategories
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nameOfCategories = categoriesNames[indexPath.row]
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "secondScreen") as! NewControllerViewController
        controller.categoryName = nameOfCategories
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
    



