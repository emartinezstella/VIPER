//
//  ListOfMoviesPresenter.swift
//  VIPER
//
//  Created by Eduardo Martinez Ibarra on 26/06/23.
//

import Foundation

protocol ListOfMoviesUI: AnyObject{
    func update(movies:[ViewModel])
}
protocol ListOfMoviesPresentable : AnyObject{
    var ui: ListOfMoviesUI? { get }
    var viewModels:[ViewModel] { get }
    func onViewAppear()
    func onTapCell(atIndex: Int)
}

class ListOfMoviesPresenter: ListOfMoviesPresentable{
    
    weak var ui : ListOfMoviesUI?
    private var models: [PopularMovieEntity] = []
    private let listOfMoviesInteractor: ListOfMoviesInteractable
    var viewModels: [ViewModel] = []
    private let mapper : Mapper
    private let router : ListOfMoviesRouting
    
    init(listOfMoviesInteractor: ListOfMoviesInteractable, mapper: Mapper = Mapper(), router: ListOfMoviesRouting) {
        self.listOfMoviesInteractor = listOfMoviesInteractor
        self.mapper = mapper
        self.router = router
    }
    
    func onViewAppear(){
        Task{
            models = await listOfMoviesInteractor.getListOfMovies().results
          
            viewModels = models.map(mapper.map(entity:))
            
            ui?.update(movies: viewModels)
        }
    }
    
    func onTapCell(atIndex: Int) {
        
        let movieId = models[atIndex].id
        router.showDetailMovie(withMovieId: movieId.description)
    }
}
