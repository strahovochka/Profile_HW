//
//  TestLocalizeViewController.swift
//  Profile
//
//  Created by Яна Страшок on 30.01.2023.
//

import UIKit

class TestLocalizeViewController: UIViewController {

    @IBOutlet weak var testLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testLabel.text = NSLocalizedString("Test label", comment: "")

        // Do any additional setup after loading the view.
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
