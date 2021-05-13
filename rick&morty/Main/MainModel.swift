//
//  Model.swift
//  rick&morty
//
//  Created by Alperen Kişi on 12/05/2021.
//

import Foundation

// MARK - MainResults
struct MainResults: Decodable {
    let results: [CharacterResult]?
}

// MARK: - CharacterResult
struct CharacterResult: Decodable {
    let id: Int?
    let name, status, species, type: String?
    let gender: String?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
}

