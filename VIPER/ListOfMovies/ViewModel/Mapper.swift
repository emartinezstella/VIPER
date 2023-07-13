//
//  Mapper.swift
//  VIPER
//
//  Created by Eduardo Martinez Ibarra on 27/06/23.
//

import Foundation

struct Mapper{
    
    func map(entity: PopularMovieEntity) -> ViewModel{
        ViewModel(title: entity.title,
                  overview: entity.overview,
                  imageUrl: URL(string: "https://image.tmdb.org/t/p/w200" + (entity.posterPath ?? "")), vote: entity.voteAverage ?? 0.0)
    }
    
}
