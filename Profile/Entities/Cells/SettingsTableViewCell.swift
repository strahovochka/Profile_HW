//
//  SettingsTableViewCell.swift
//  Profile
//
//  Created by Jane Strashok on 14.03.2023.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var soundSwitch: UISwitch!
    @IBOutlet weak var soundLabel: UILabel!
    @IBOutlet weak var generalLabel: UILabel!
    @IBOutlet weak var vibrateSwitch: UISwitch!
    @IBOutlet weak var generalSwitch: UISwitch!
    @IBOutlet weak var vibrateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
