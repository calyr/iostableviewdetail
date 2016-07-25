//
//  Celda.swift
//  NuevoTableView
//
//  Created by Roberto Carlos Callisaya Mamani on 7/25/16.
//  Copyright © 2016 Roberto Carlos Callisaya Mamani. All rights reserved.
//

import UIKit

class Celda: UITableViewCell {

    @IBOutlet weak var titulo: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
