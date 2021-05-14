//
//  DetailViewModel.swift
//  rick&morty
//
//  Created by Alperen Kişi on 13/05/2021.
//

import Foundation

class DetailViewModel {
    
    var characterModel: CharacterResult?
    var episodeList = [String]()
    
    init(characterModel: CharacterResult?) {
        self.characterModel = characterModel
    }
    
    func getEpisodeDetail(onCompleted: @escaping ([String]) -> (), onFailed: @escaping () -> ()) {
        guard let urlList = characterModel?.episode else { return }
        for url in urlList {
            NetworkManager.shared.request(with: url, onComplete: { [weak self] (data: EpisodeDetailModel) in
                guard let self = self, let name = data.name, let episode = data.episode else { return }
                let result = name + " - " + episode
                self.episodeList.append(result)
                onCompleted(self.episodeList)
            }, onError: {
                onFailed()
            })
        }
    }
}
