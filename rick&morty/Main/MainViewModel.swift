//
//  MainViewModel.swift
//  rick&morty
//
//  Created by Alperen Kişi on 12/05/2021.
//

import Foundation

class MainViewModel {
    
    var characterList = [CharacterResult]()
    
    func getCharactersData(onCompleted: @escaping () -> ()) {
        NetworkManager.shared.request(with: getCharactersURL(), onComplete: { [weak self] (data: MainResults) in
            guard let self = self else { return }
            self.handleCharactersData(data)
            onCompleted()
        })
    }
    
    func handleCharactersData(_ data: MainResults) {
        guard let results = data.results else { return }
        for result in results {
            let model = CharacterResult(id: result.id,
                                        name: result.name,
                                        status: result.status,
                                        species: result.species,
                                        type: result.type,
                                        gender: result.gender,
                                        image: result.image,
                                        episode: result.episode,
                                        url: result.url,
                                        created: result.created)
            characterList.append(model)
        }
    }
    
    func getCharactersURL() -> String {
        return NetworkParameters.baseURL + NetworkParameters.apiParameter + NetworkParameters.characterParameter
    }
}
