//
//  FruitsViewController.swift
//  1.05.18
//
//  Created by Dima on 10.05.2018.
//  Copyright © 2018 Samus Dimitriy. All rights reserved.
//

import UIKit

class FruitsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    

    @IBOutlet weak var tableView: UITableView!
    var categoryName: String?
    var frutsDict: [String] = []
    var parser = Parser()
    let loader = Loader()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let catName = categoryName {
            loader.loadProducts(categories: catName, finishBlock: { categories, error in
                guard error == nil else {
                    self.error()
                    return
                }
                
                self.frutsDict.append(contentsOf: categories)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            })
        
        }
   
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return frutsDict.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MyCell = self.tableView.dequeueReusableCell(withIdentifier: "secondCell") as! MyCell
        let nameOfFruts = frutsDict[indexPath.row]
        cell.nameLabel.text = nameOfFruts
        return cell
    }

}
