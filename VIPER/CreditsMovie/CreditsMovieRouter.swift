//
//  CreditsMovieRouter.swift
//  VIPER
//
//  Created by Eduardo Martinez Ibarra on 29/06/23.
//

import Foundation
import UIKit

protocol CreditsMovieRouting: AnyObject{
    func showCredits(fromViewController: UIViewController, withMovieId movieId: String)
}

class CreditsMovieRouter : CreditsMovieRouting{
    
    func showCredits(fromViewController: UIViewController, withMovieId movieId: String){
        
        let interactor = CreditMovieInteractor()
        let presenter = CreditsMoviePresenter(movieId: movieId, interactor: interactor, mapper: MapperCreditMovieViewModel())
        
        let view = CreditsMovieView(presenter: presenter)
        presenter.ui =  view
        
        fromViewController.navigationController?.pushViewController(view, animated: true)
        
    }
    
}
