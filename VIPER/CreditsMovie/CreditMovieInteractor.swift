//
//  CreditMovieInteractor.swift
//  VIPER
//
//  Created by Eduardo Martinez Ibarra on 29/06/23.
//

import Foundation

protocol CreditMovieInteractable{
    func getMovieCredits(withId id: String) async -> CreditMovieResponseEntity
}

class CreditMovieInteractor: CreditMovieInteractable{
    
    func getMovieCredits(withId id: String) async -> CreditMovieResponseEntity{
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(id)/credits?api_key=04eef7ec96040cd12f41b5a3b3858911")
        let (data, _) = try! await URLSession.shared.data(from: url!)
        //let str = String(decoding: data, as: UTF8.self)
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
       
        return try! jsonDecoder.decode(CreditMovieResponseEntity.self, from: data)

    }
    
}
