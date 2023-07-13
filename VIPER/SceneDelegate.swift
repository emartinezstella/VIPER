//
//  SceneDelegate.swift
//  VIPER
//
//  Created by Eduardo Martinez Ibarra on 15/06/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var listOfMoviewRouter = ListOfMoviesRouter()


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        listOfMoviewRouter.showListOfMovies(window: window)
    }

   
}

