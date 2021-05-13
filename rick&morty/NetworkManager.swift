//
//  MainResultRequest.swift
//  rick&morty
//
//  Created by Alperen Kişi on 12/05/2021.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func request<T: Decodable>(with url: String, onComplete: @escaping (T) -> ()) {
        AF.request(url, method: .get, encoding: URLEncoding.default).response { (response) in
            guard let remoteData = response.data else { fatalError() }
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: remoteData)
                onComplete(decodedData)
            } catch let error {
                print(error)
            }
        }
    }
}
