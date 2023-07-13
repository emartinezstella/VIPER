//
//  PopularMovieEntity.swift
//  VIPER
//
//  Created by Eduardo Martinez Ibarra on 26/06/23.
//

import Foundation

struct PopularMovieEntity: Decodable{
    
    let id : Int
    let title : String
    let overview: String
    let posterPath: String?
    let voteAverage: Double?
    
    enum CodingKeys: String, CodingKey{
        case id
        case title, overview
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
    }
    
}
