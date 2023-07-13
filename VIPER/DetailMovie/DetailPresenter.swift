//
//  DetailPresenter.swift
//  VIPER
//
//  Created by Eduardo Martinez Ibarra on 28/06/23.
//

import Foundation

protocol DetialPresenterUI: AnyObject{
    func updateUI(viewModel: DetailMovieViewModel)
}

protocol DetailPresentable: AnyObject{
    var ui: DetialPresenterUI? { get }
    var movieId: String { get }
    func onViewAppear()
    func showCredits(withMovieId movieId: String)
}

class DetailPresenter: DetailPresentable{
    
    weak var ui: DetialPresenterUI?
    let movieId: String
    private let interactor: DetailInteractable
    private let mapper: MapperDetailMovieViewModel
    private let router: DetailRouting
    
    init(movieId: String, interactor: DetailInteractable, mapper: MapperDetailMovieViewModel, router: DetailRouting) {
        self.movieId = movieId
        self.interactor = interactor
        self.mapper = mapper
        self.router = router
    }
    
    func onViewAppear(){
        Task{
            let model = await interactor.getDetailMovie(withId: movieId)
            let viewModel = mapper.map(entity: model)
           
            await MainActor.run{
                self.ui?.updateUI(viewModel:viewModel)
            }
        }
    }
    
    func showCredits(withMovieId movieId: String){
        router.showCredits(withMovieId: movieId)
    }
    
}
