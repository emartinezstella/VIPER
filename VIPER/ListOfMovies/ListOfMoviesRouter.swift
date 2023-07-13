//
//  ListOfMoviesRouter.swift
//  VIPER
//
//  Created by Eduardo Martinez Ibarra on 26/06/23.
//

import Foundation
import UIKit

protocol ListOfMoviesRouting: AnyObject{
    var detailRouter: DetailRouting? { get }
    var listOfMoviesView : ListOfMoviesView? { get }
    func showListOfMovies(window: UIWindow?)
    func showDetailMovie(withMovieId movieId: String)
}

class ListOfMoviesRouter: ListOfMoviesRouting{
    
    var detailRouter: DetailRouting?
    var listOfMoviesView : ListOfMoviesView?
    
    func showListOfMovies(window: UIWindow?){
        
        self.detailRouter = DetailRouter()
        let interactor = ListOfMoviesInteractor()
        let presenter = ListOfMoviesPresenter(listOfMoviesInteractor: interactor,
                                              router: self)
        listOfMoviesView = ListOfMoviesView(presenter: presenter)
        presenter.ui = listOfMoviesView
        
        guard let listOfMoviesView = self.listOfMoviesView else {
            return
        }
        
        window?.rootViewController = UINavigationController(rootViewController: listOfMoviesView)
        window?.makeKeyAndVisible()
    }
    
    func showDetailMovie(withMovieId movieId: String){
        guard let vc = listOfMoviesView else {
            return
        }
        
        detailRouter?.showDetail(fromViewController: vc, withMovieId: movieId)
    }
}
