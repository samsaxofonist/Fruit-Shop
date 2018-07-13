//
//  FruitsViewController.swift
//  1.05.18
//
//  Created by Dima on 10.05.2018.
//  Copyright © 2018 Samus Dimitriy. All rights reserved.
//

import UIKit

class FruitsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
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
                    self.activity.isHidden = true
                }
            })
        
        }
        func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
            return true
        }
        
   
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow{
            let fruit = frutsDict[indexPath.row]
            
            
            let detailVC = segue.destination as! CalendarViewController
            detailVC.receivedImage = imageFromName(name: fruit)
        }
    }
    
    
    
    
    
    
    
    
    
    func imageFromName(name: String) -> UIImage {
        
        if name == "Bananas"{
            return #imageLiteral(resourceName: "banana")
        } else if name == "Pineapples" {
            return #imageLiteral(resourceName: "pineapple")
        } else if name == "Fresh" {
            return #imageLiteral(resourceName: "iconWatermelon")
        } else if name == "Exotic" {
            return #imageLiteral(resourceName: "iconExotic")
        } else if name == "Nuts" {
            return #imageLiteral(resourceName: "iconNut")
        } else {
            return #imageLiteral(resourceName: "placeholder")
        }
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return frutsDict.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CellFruts = self.tableView.dequeueReusableCell(withIdentifier: "secondCell") as! CellFruts
        let nameOfFruts = frutsDict[indexPath.row]
        cell.labelFruits.text = nameOfFruts
        cell.imageFruits.image = imageFromName(name: nameOfFruts)
        return cell
    }
    private func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
        }
    }

}
