//
//  ProfileViewController.swift
//  Profile
//
//  Created by Яна Страшок on 22.12.2022.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var sectionGap: CGFloat = 6
    
    enum CellType {
        case name(String)
        case nickName(String)
        case email(String)
        case phone(String)
        case countryAndGender(String, String)
        case address(String)
        case settings(Bool, Bool, Bool)
        
        var cellIdn: String {
            switch self {
            case .countryAndGender:
                return "CountryAndGenderTableViewCell"
            case .settings:
                return "SettingsTableViewCell"
            default:
                return "EditProfileTableViewCell"
            }
        }
    }
    
    var cells: [CellType]?
    var userProfile: UserProfile?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configTable()
        configCells()

    }
    
    //MARK: -table view config
    
    private func configTable() {
        
        tableView.register(UINib(nibName: "EditProfileTableViewCell", bundle: nil), forCellReuseIdentifier: "EditProfileTableViewCell")
        
        tableView.register(UINib(nibName: "CountryAndGenderTableViewCell", bundle: nil), forCellReuseIdentifier: "CountryAndGenderTableViewCell")
        
        tableView.register(UINib(nibName: "SettingsTableViewCell", bundle: nil), forCellReuseIdentifier: "SettingsTableViewCell")
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
    }
    
    private func configCells() {
        let user = userProfile ?? UserProfile(name: "Puerto Rico", nickName: "puerto_rico", email: "something@gmail.com", phoneNumber: "1234-56-789", country: "USA", gender: "Female", address: "46 St. Road", isGeneralNotifications: true, isSound: true, isVibrate: true)
        
        cells = [
            .name(user.name),
            .nickName(user.nickName),
            .email(user.email),
            .phone(user.phoneNumber),
            .countryAndGender(user.country, user.gender.toString),
            .address(user.address),
            .settings(user.isGeneralNotifications, user.isSound, user.isVibrate)
        ]
    }
    
    //MARK: -table configuration
    
    private func styleCell(_ cell: UIView) {
        cell.layer.borderColor = UIColor.white.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
        
        cell.layer.shadowRadius = 4
        cell.layer.shadowOpacity = 1
        cell.layer.shadowOffset = CGSize(width: 0, height: 4)
        cell.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
    }
    
    @IBAction func ProfileUnwinsegue( _ segue: UIStoryboardSegue) {


    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        cells?.count ?? 0
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        sectionGap
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: cells?[indexPath.section].cellIdn ?? "", for: indexPath) as? EditProfileTableViewCell {
            switch cells?[indexPath.section] {
            case let .name(name):
                cell.headerLabel.text = "Name"
                cell.textField.text = name
            case let .nickName(nickName):
                cell.headerLabel.text = "Nick name"
                cell.textField.text = nickName
            case let .email(email):
                cell.headerLabel.text = "Email"
                cell.textField.text = email
            case let .phone(phone):
                cell.headerLabel.text = "Phone"
                cell.textField.text = phone
            case let .address(address):
                cell.headerLabel.text = "Address"
                cell.textField.text = address
            default:
                break
            }
            styleCell(cell)
            
            return cell
            
        } else if let cellCountry = tableView.dequeueReusableCell(withIdentifier: cells?[indexPath.section].cellIdn ?? "", for: indexPath) as? CountryAndGenderTableViewCell {
            switch cells?[indexPath.section] {
            case let .countryAndGender(country, gender):
                cellCountry.containers.forEach { styleCell($0) }
                
                cellCountry.countryLabel.text = "Country"
                cellCountry.countryTextField.text = country
                cellCountry.genderLabel.text = "Gender"
                cellCountry.genderTextField.text = gender
            default:
                break
            }
            cellCountry.backgroundColor = .clear
            return cellCountry
            
        } else if let cellSettings = tableView.dequeueReusableCell(withIdentifier: cells?[indexPath.section].cellIdn ?? "", for: indexPath) as? SettingsTableViewCell {
            switch cells?[indexPath.section] {
            case let .settings(general, sound, vibrate):
                cellSettings.generalLabel.text = "General Notifications"
                cellSettings.soundLabel.text = "Sound"
                cellSettings.vibrateLabel.text = "Vibrate"
                cellSettings.generalSwitch.isOn = general
                cellSettings.soundSwitch.isOn = sound
                cellSettings.vibrateSwitch.isOn = vibrate
            default:
                break
            }
            
            styleCell(cellSettings)
            
            return cellSettings
            
        } else {
            return UITableViewCell()
        }
    }

}
