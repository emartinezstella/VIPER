//
//  MapperCreditMovieViewModel.swift
//  VIPER
//
//  Created by Eduardo Martinez Ibarra on 29/06/23.
//

import UIKit

struct MapperCreditMovieViewModel{

    func map(entity: CreditMovieEntity) -> CreditMovieViewModel{
        .init(name: entity.name, imageUrl: URL(string: "https://image.tmdb.org/t/p/w200" + (entity.profilePath ?? "")) , character: entity.character ?? "", job: entity.job ?? "")
    }
    
}
