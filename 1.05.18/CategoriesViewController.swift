//
//  CategoriesViewController.swift
//  1.05.18
//
//  Created by Dima on 01.05.2018.
//  Copyright © 2018 Samus Dimitriy. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var categoriesNames: [String] = []
    let loader = Loader()
    
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loader.loadCategories(finishBlock: { categories, error in
            guard error == nil else {
                self.error()
                return
            }
            
            self.categoriesNames.append(contentsOf: categories)
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.activity.isHidden = true
            }
        })
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoriesNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CellCategories = self.tableView.dequeueReusableCell(withIdentifier: "firstCell") as! CellCategories
        let nameOfCategories = categoriesNames[indexPath.row]
        cell.nameLabel.text = nameOfCategories
        if nameOfCategories == "Fruits" {
            cell.imegeView.image = UIImage(named: "banana")
        } else if nameOfCategories == "Dried" {
            cell.imegeView.image = UIImage(named: "iconDried")
        } else if nameOfCategories == "Fresh" {
            cell.imegeView.image = UIImage(named: "iconWatermelon")
        } else if nameOfCategories == "Exotic" {
            cell.imegeView.image = UIImage(named: "iconExotic")
        } else if nameOfCategories == "Nuts" {
            cell.imegeView.image = #imageLiteral(resourceName: "iconNut")
        } else {
            cell.imegeView.image = #imageLiteral(resourceName: "placeholder")
        }
        
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nameOfCategories = categoriesNames[indexPath.row]
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "secondScreen") as! FruitsViewController
        controller.categoryName = nameOfCategories
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        self.categoriesNames.remove(at: indexPath.row)
        tableView.reloadData()
    }
}
    



