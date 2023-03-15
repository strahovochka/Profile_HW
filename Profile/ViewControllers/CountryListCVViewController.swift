//
//  CountryListCVViewController.swift
//  Profile
//
//  Created by Яна Страшок on 30.01.2023.
//

import UIKit

class CountryListCVViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    let availableCountries = RegionService().getAvailableCountries()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configCollectionView()

        // Do any additional setup after loading the view.
    }
    
    private func configCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(CountryCollectionViewCell.self, forCellWithReuseIdentifier: "CountryCollectionViewCell")
        collectionView.register(UINib(nibName: "CountryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CountryCollectionViewCell")
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

extension CountryListCVViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize  {
        //let size = collectionView.frame.size
        return CGSize(width: (view.frame.width / 2) - 6, height: 200)
    }
}

extension CountryListCVViewController: UICollectionViewDelegate {
    
}

extension CountryListCVViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CountryCollectionViewCell", for: indexPath) as? CountryCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.cityNameLabel.text = availableCountries[indexPath.row].city
        cell.countryNameLabel.text = availableCountries[indexPath.row].country
        
        return cell
    }
    
    
}
