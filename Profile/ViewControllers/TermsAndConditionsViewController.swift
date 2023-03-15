//
//  TermsAndConditionsViewController.swift
//  Profile
//
//  Created by Яна Страшок on 26.12.2022.
//

import UIKit

class TermsAndConditionsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onCloseButtonTouched(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func TAndCUnwinsegue( _ segue: UIStoryboardSegue) {


    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
