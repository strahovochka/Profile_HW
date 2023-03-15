//
//  CountrieListViewController.swift
//  Profile
//
//  Created by Яна Страшок on 15.01.2023.
//

import UIKit

class CountrieListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var availableCountries = RegionService().getAvailableCountries()
    var selectedCountryRow = 0
    
    private var chosenCity: Country?
    
    enum SectionType {
        case cities([Country])
        case chosen(Country)
        
        var cellIdn: String {
            switch self {
            case .cities:
                return "CountryTableViewCell"
            case .chosen:
                return "FavoriteCountryTableViewCell"
            }
        }
    }
    
    private var sections: [SectionType]?

    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(didRefresh), for: .valueChanged)
        tableView.refreshControl = refreshControl
        
        configTableView()
        configSections()
        // Do any additional setup after loading the view.
    }
    
    // MARK: Config section
    
    private func configTableView() {
        tableView.register(UINib(nibName: "CountryTableViewCell", bundle: nil), forCellReuseIdentifier: "CountryTableViewCell")
        
        tableView.register(UINib(nibName: "FavoriteCountryTableViewCell", bundle: nil), forCellReuseIdentifier: "FavoriteCountryTableViewCell")
        
        availableCountries[selectedCountryRow].isChosen = true

        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func configSections() {
        chosenCity = availableCountries[selectedCountryRow]
        availableCountries[selectedCountryRow].isChosen = true
        
        sections = [
            .chosen(chosenCity ?? Country(with: "Undef", in: "Undef")),
            .cities(availableCountries)
        ]
    }
    
    //MARK: Table View Appearence and logic
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sections?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch sections?[section] {
        case .chosen:
            return 1
        case let .cities(cities):
            return cities.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch sections?[indexPath.section] {
        case let .chosen(chosen):
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: sections?[indexPath.section].cellIdn ?? "", for: indexPath) as? FavoriteCountryTableViewCell else {
                return UITableViewCell()
            }
            
            let selectedCountry = chosen
            cell.accessoryType = .none
            cell.cityNameLabel.text = selectedCountry.city
            cell.countryNameLabel.text = selectedCountry.country
            return cell
        case let .cities(cities):
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: sections?[indexPath.section].cellIdn ?? "", for: indexPath) as? CountryTableViewCell else {
                return UITableViewCell()
            }
            
            let country = cities[indexPath.row]
            cell.accessoryType = country.isChosen ? .checkmark : .none
            cell.cityName.text = country.city
            cell.countryName.text = country.country
            return cell
        default:
            break
        }
        return UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        guard let cell = tableView.cellForRow(at: indexPath) as? CountryTableViewCell else {
            return
        }
        
        if selectedCountryRow == indexPath.row {
            return
        }
        
        if let previousRow = tableView.cellForRow(at: IndexPath(row: selectedCountryRow, section: indexPath.section)) as? CountryTableViewCell {
            previousRow.accessoryType = .none
        }
        availableCountries[selectedCountryRow].isChosen = false
        selectedCountryRow = indexPath.row
        availableCountries[selectedCountryRow].isChosen = true
        cell.accessoryType = .checkmark
        
        chosenCity = availableCountries[selectedCountryRow]
        sections?[0] = .chosen(chosenCity ?? Country(with: "Undef", in: "Undef"))
        tableView.reloadData()
    }
    
    /*func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 100))
        view.backgroundColor = .darkGray
        return view
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 100))
        view.backgroundColor = .green
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        100
    }*/
    
    //MARK: Navigation
    
    @IBAction func onDoneButtonTouched(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let editProfileVC = segue.destination as? EditViewController {
            editProfileVC.countryLable.text = availableCountries[selectedCountryRow].city
        }
    }
    
    @objc
    func didRefresh(control: UIRefreshControl) {
        control.endRefreshing()
        tableView.reloadData()
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


