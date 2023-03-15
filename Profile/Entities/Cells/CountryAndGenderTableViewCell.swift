//
//  TableViewCell.swift
//  Profile
//
//  Created by Jane Strashok on 09.03.2023.
//

import UIKit

class CountryAndGenderTableViewCell: UITableViewCell {

    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet var containers: [UIView]!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.selectedBackgroundView?.backgroundColor = .clear
        // Configure the view for the selected state
    }
    
}
