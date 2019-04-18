//
//  CustomizedUserCell.swift
//  Token
//
//  Created by P. J. Hernandez on 4/13/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
// messing around with customized table view cells
class CustomizedUserCell: UITableViewCell {
    
   
    @IBOutlet weak var firstNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        toggleCheckmark(selected: false)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated )
    }
    
    func toggleCheckmark(selected: Bool) {

        let image = selected ? "messageSignal2Checked" : "messageSignal2"
        self.accessoryView = UIImageView(image: UIImage(named: image))
        
    }
    func updateUI(user: User) {
        print(user.firstName)
        firstNameLabel.text = user.firstName
        
    }
    
}
