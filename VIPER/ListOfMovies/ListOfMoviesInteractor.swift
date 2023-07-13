//
//  ListOfMoviesInteractor.swift
//  VIPER
//
//  Created by Eduardo Martinez Ibarra on 26/06/23.
//

import Foundation

protocol ListOfMoviesInteractable: AnyObject{
    func getListOfMovies() async -> PopularMovieResponseEntity
}

//04eef7ec96040cd12f41b5a3b3858911
class ListOfMoviesInteractor: ListOfMoviesInteractable{
    func getListOfMovies() async -> PopularMovieResponseEntity{
        let  url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=04eef7ec96040cd12f41b5a3b3858911")!
        let (data, _) = try! await URLSession.shared.data(from: url)
       // let str = String(decoding: data, as: UTF8.self)
        return try! JSONDecoder().decode(PopularMovieResponseEntity.self, from: data)
    }
}

class ListOfMoviesInteractorMock: ListOfMoviesInteractable{
    func getListOfMovies() async -> PopularMovieResponseEntity {
        return PopularMovieResponseEntity(results: [
            .init(id: 0, title: "La bruja de blair", overview: "bruja en bosque", posterPath: "", voteAverage: 4.0)])
    }
}
