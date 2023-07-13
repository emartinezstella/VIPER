//
//  CreditMovieEntity.swift
//  VIPER
//
//  Created by Eduardo Martinez Ibarra on 29/06/23.
//

import Foundation

struct CreditMovieEntity: Decodable{
    
    let name: String
    let profilePath: String?
    let character: String?
    let job: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case profilePath = "profile_path"
        case character
        case job = "job"
    }
    
}
