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
            }
        })
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
        let controller = storyboard.instantiateViewController(withIdentifier: "secondScreen") as! FruitsViewController
        controller.categoryName = nameOfCategories
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
    



