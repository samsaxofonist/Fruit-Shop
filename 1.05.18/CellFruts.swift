//
//  CellFruts.swift
//  15.05.18
//
//  Created by Andrii Kravchenko on 17.06.18.
//  Copyright © 2018 Samus Dimitriy. All rights reserved.
//

import UIKit

class CellFruts: UITableViewCell {

    @IBOutlet weak var container: UIView!
    @IBOutlet weak var imageFruits: UIImageView!
    @IBOutlet weak var labelFruits: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.container.layer.cornerRadius = 5
        self.container.layer.shadowColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        self.container.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.container.layer.shadowOpacity = 0.5
        self.container.layer.masksToBounds = false
}
}
