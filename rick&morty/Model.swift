//
//  Model.swift
//  rick&morty
//
//  Created by Alperen Kişi on 12/05/2021.
//

import Foundation

struct Response: Decodable {
    var results : [String : Results]
}

struct Results: Decodable {
    let id : Int?
    let name : String?
    let status : String?
    let gender : String?
    let species : String?
    let image : URL?
    let episode : [String]?
}

