//
//  DetailViewModel.swift
//  rick&morty
//
//  Created by Alperen Kişi on 13/05/2021.
//

import Foundation

class DetailViewModel {
    
    var characterModel: CharacterResult?
    
    init(characterModel: CharacterResult?) {
        self.characterModel = characterModel
    }
}
