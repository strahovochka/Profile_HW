//
//  Country.swift
//  Profile
//
//  Created by Яна Страшок on 17.01.2023.
//

import Foundation

class Country {
    let city: String
    let country: String
    var isChosen = false
    
    init(with city: String, in country: String, isChosen: Bool = false) {
        self.city = city
        self.country = country
        self.isChosen = isChosen
    }
}
