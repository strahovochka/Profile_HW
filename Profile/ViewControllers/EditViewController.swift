//
//  EditViewController.swift
//  Profile
//
//  Created by Яна Страшок on 19.12.2022.
//

import UIKit

class EditViewController: UIViewController {
    
    private let showProfileIdn = "ShowProfile"
    private let showScreen2 = "ShowScreen2"
    private let showScreen3 = "ShowScreen3"
    
    private var allowSegue = true

    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var nickNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    @IBOutlet weak var countryLable: UILabel!
    @IBOutlet weak var GenderTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    @IBOutlet var textFieldsCollection: [UITextField]!
    @IBOutlet var containerViewCollection: [UIView]!
    
    @IBOutlet weak var generalNotificationsSwitch: UISwitch!
    @IBOutlet weak var vibrateSwitch: UISwitch!
    @IBOutlet weak var soundSwitch: UISwitch!
    
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        containerViewCollection.forEach {
            $0.layer.cornerRadius = 8
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.white.cgColor
            
            $0.layer.shadowRadius = 4
            $0.layer.shadowOpacity = 1
            $0.layer.shadowOffset = CGSize(width: 0, height: 4)
            $0.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        }

        submitButton.layer.borderWidth = 1
        submitButton.layer.cornerRadius = 8
        submitButton.layer.borderColor = UIColor.darkGray.cgColor
    }

    @IBAction func onSubmitButtonTouched(_ sender: Any) {
        
        guard  let name = fullNameTextField.text, !name.isEmpty,
               let nickName = nickNameTextField.text, !nickName.isEmpty,
               let email = emailTextField.text, !email.isEmpty,
               let phoneNumber = phoneNumberTextField.text, !phoneNumber.isEmpty,
               let country = countryLable.text, !country.isEmpty,
               let gender = GenderTextField.text, !gender.isEmpty,
               let address = addressTextField.text, !address.isEmpty else {
            allowSegue = false
            return 
        }
        
        fullNameTextField.textColor = #colorLiteral(red: 0.9843137255, green: 0.9843137255, blue: 0.9843137255, alpha: 1)
        emailTextField.textColor = #colorLiteral(red: 0.9843137255, green: 0.9843137255, blue: 0.9843137255, alpha: 1)
        
        if name.count <= 3 {
            fullNameTextField.textColor = .red
            allowSegue = false
        }
        
        if !email.contains("@") {
            emailTextField.textColor = .red
            allowSegue = false
        }
        
        performSegue(withIdentifier: showProfileIdn, sender: sender)
        
    }
    
    @IBAction func onCountryButtonTouched(_ sender: Any) {
        performSegue(withIdentifier: "ShowCountriesList", sender: sender)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let profileVC = segue.destination as? ProfileViewController,
           segue.identifier == showProfileIdn {
            
            profileVC.userProfile = UserProfile(name: fullNameTextField.text ?? "",
                                                nickName: nickNameTextField.text ?? "",
                                                email: emailTextField.text ?? "",
                                                phoneNumber: phoneNumberTextField.text ?? "",
                                                country: countryLable.text ?? "",
                                                gender: GenderTextField.text ?? "",
                                                address: addressTextField.text ?? "",
                                                isGeneralNotifications: generalNotificationsSwitch.isOn,
                                                isSound: soundSwitch.isOn,
                                                isVibrate: vibrateSwitch.isOn)
        }
        
        if let countryVC = segue.destination as? CountrieListViewController, segue.identifier == "ShowCountriesList" {
            let rs = RegionService().getAvailableCountries()
            countryVC.selectedCountryRow = rs.firstIndex(where: { $0.city == countryLable.text }) ?? 0
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == showProfileIdn {
            return allowSegue
        }
        return true
    }
    
    @IBAction func editeProfileUnwinsegue( _ segue: UIStoryboardSegue) {


    }
}
