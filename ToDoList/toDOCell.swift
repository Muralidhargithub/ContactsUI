//
//  toDOCell.swift
//  ToDoList
//
//  Created by Muralidhar reddy Kakanuru on 11/19/24.
//

import UIKit

class toDOCell: UITableViewCell {

    @IBOutlet var info: UIButton!
    @IBOutlet var contactNumber: UILabel!
    @IBOutlet var contactName: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
