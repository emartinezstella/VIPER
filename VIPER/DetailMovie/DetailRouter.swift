//
//  DetailRouter.swift
//  VIPER
//
//  Created by Eduardo Martinez Ibarra on 28/06/23.
//

import Foundation
import UIKit

protocol DetailRouting: AnyObject{
    var creditsMovieRouter: CreditsMovieRouting? { get }
    var detailView: DetailView? { get }
    func showDetail(fromViewController: UIViewController ,withMovieId movieId: String)
    func showCredits(withMovieId movieId: String)
}

class DetailRouter: DetailRouting{
    
    var creditsMovieRouter: CreditsMovieRouting?
    var detailView: DetailView?
    
    func showDetail(fromViewController: UIViewController ,withMovieId movieId: String){
        self.creditsMovieRouter = CreditsMovieRouter()
        let interactor = DetailInteractor()
        let presenter = DetailPresenter(movieId: movieId, interactor: interactor, mapper: MapperDetailMovieViewModel(), router: self)
        
        detailView = DetailView(presenter: presenter)
        presenter.ui = detailView
        
        guard let detailView = self.detailView else {
            return
        }
        
        fromViewController.navigationController?.pushViewController(detailView, animated: true)
        
    }
    
    func showCredits(withMovieId movieId: String){
        guard let vc = detailView else {
            return
        }
        
        creditsMovieRouter?.showCredits(fromViewController: vc, withMovieId: movieId)
    }

    
}
