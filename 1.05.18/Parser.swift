//
//  Parser.swift
//  1.05.18
//
//  Created by Dima on 15.05.2018.
//  Copyright © 2018 Samus Dimitriy. All rights reserved.
//

import Foundation

class Parser {
    
    func parseItems(data: Data?, key: String) -> [String] {
        guard let validData = data else { return [] }
        guard let json = try? JSONSerialization.jsonObject(with: validData, options: []) else { return [] }
        guard let dict = json as? [String: Any] else { return [] }
        guard let categories = dict[key] as? [[String: Any]] else { return [] }
        
        var categoriesNames: [String] = []
        
        for catDict in categories {
            if let catKey = catDict["name"] as? String {
                categoriesNames.append(catKey)
            }
        }
        return categoriesNames
    }
}
