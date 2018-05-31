//
//  Loader.swift
//  15.05.18
//
//  Created by Andrii Kravchenko on 31.05.18.
//  Copyright © 2018 Samus Dimitriy. All rights reserved.
//

import Foundation

class Loader {
    let parser = Parser()
    
    func loadCategories(finishBlock: @escaping (([String], Error?) -> Void)) {
        let serverAdress: String = "http://api.predic8.de/shop/categories/"

        if let myUrl = URL(string: serverAdress) {
            
            let block: ((Data?, URLResponse?, Error?) -> Void) = { data, response, error in
                let categories = self.parser.parseItems(data: data, key: "categories")
                finishBlock(categories, error)
            }
            
            let request = URLSession.shared.dataTask(with: myUrl, completionHandler: block)
            
            request.resume()
        }
    }
    
    func loadProducts(categories: String, finishBlock: @escaping (([String], Error?) -> Void)) {
        let serverAdress: String = "http://api.predic8.de/shop/categories/\(categories)"
        
        if let myUrl = URL(string: serverAdress) {
            
            let block: ((Data?, URLResponse?, Error?) -> Void) = { data, response, error in
                let categories = self.parser.parseItems(data: data, key: "products")
                finishBlock(categories, error)
            }
            
            let request = URLSession.shared.dataTask(with: myUrl, completionHandler: block)
            
            request.resume()
        }
    }
}
