//
//  MapperDetailMoviewViewModel.swift
//  VIPER
//
//  Created by Eduardo Martinez Ibarra on 28/06/23.
//

import Foundation
struct MapperDetailMovieViewModel{
    func map(entity:DetailMovieEntity) -> DetailMovieViewModel{
        .init(title: entity.title,
              overview: entity.overview,
              backdropPath: URL(string: "https://image.tmdb.org/t/p/w200" + entity.backdropPath))
    }
}
