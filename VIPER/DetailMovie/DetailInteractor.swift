//
//  DetailInteractor.swift
//  VIPER
//
//  Created by Eduardo Martinez Ibarra on 28/06/23.
//

import Foundation

protocol DetailInteractable: AnyObject{
    func getDetailMovie(withId id: String) async -> DetailMovieEntity
}

class DetailInteractor: DetailInteractable {
    func getDetailMovie(withId id: String) async -> DetailMovieEntity {
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(id)?api_key=04eef7ec96040cd12f41b5a3b3858911")!
        let (data, _) = try! await URLSession.shared.data(from: url)
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        return try! jsonDecoder.decode(DetailMovieEntity.self, from: data)
        
    }
}
