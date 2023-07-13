//
//  DetailMovieEntity.swift
//  VIPER
//
//  Created by Eduardo Martinez Ibarra on 28/06/23.
//

import Foundation

struct DetailMovieEntity: Decodable{
    
    let title: String
    let overview: String
    let backdropPath: String
    let status: String
    let releaseDate: String
    let voteAverage: Double
    let voteCount: Int
    
    enum CodingKeys: String, CodingKey{
        case title
        case overview
        case backdropPath
        case status
        case releaseDate
        case voteAverage
        case voteCount 
    }
}
