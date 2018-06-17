//
//  MyCell.swift
//  1.05.18
//
//  Created by Dima on 10.05.2018.
//  Copyright © 2018 Samus Dimitriy. All rights reserved.
//

import UIKit

class CellCategories: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var imegeView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.container.layer.cornerRadius = 5
        self.container.layer.shadowColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        self.container.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.container.layer.shadowOpacity = 0.5
        self.container.layer.masksToBounds = false
    }
    
}
