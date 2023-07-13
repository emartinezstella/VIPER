//
//  CreditsMoviePresenter.swift
//  VIPER
//
//  Created by Eduardo Martinez Ibarra on 29/06/23.
//

import Foundation

protocol CreditMovieUI: AnyObject{
    func updateUI(viewModel: [CreditMovieViewModel])
}

protocol CreditsMoviePresentable{
    var ui: CreditMovieUI? { get }
    var movieId: String { get }
    var viewModel: [CreditMovieViewModel] { get }
    func onViewAppear()
}

class CreditsMoviePresenter: CreditsMoviePresentable{
    weak var ui: CreditMovieUI?
    var movieId: String
    var viewModel: [CreditMovieViewModel] = []
    private let interactor : CreditMovieInteractor
    private let mapper : MapperCreditMovieViewModel
    
    init(movieId: String, interactor: CreditMovieInteractor, mapper: MapperCreditMovieViewModel) {
        self.interactor = interactor
        self.movieId = movieId
        self.mapper = mapper
    }
    
    func onViewAppear(){
        Task{
            let model = await interactor.getMovieCredits(withId: self.movieId).crew
            viewModel = model.map(mapper.map(entity:))
        
            await MainActor.run{
                self.ui?.updateUI(viewModel:viewModel)
            }
        }
    }
}
