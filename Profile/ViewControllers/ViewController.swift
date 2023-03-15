//
//  ViewController.swift
//  Profile
//
//  Created by Яна Страшок on 19.12.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onLogOutButtonTouched(_ sender: Any) {
        guard let redVC = storyboard?.instantiateViewController(withIdentifier: "redVC") else {
            return
        }
        navigationController?.viewControllers = [redVC]
    }
    
}

