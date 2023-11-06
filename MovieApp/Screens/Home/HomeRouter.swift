//
//  HomeRouter.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 26/10/23.
//

import Foundation
import UIKit

protocol HomeRouterInterface {
    var view: UINavigationController? { get set }
    var presenter: HomePresenterInterface? { get set }
    static func createModule() -> UINavigationController
    
    func navigateToMovies(data: MovieResult?, type: String)
    var movieViewController: UINavigationController? { get set }
}

class HomeRouter: HomeRouterInterface {
        
    var presenter: HomePresenterInterface?
    var view: UINavigationController?
    var movieViewController: UINavigationController?
    
    static func createModule() -> UINavigationController {
        let router = HomeRouter()
        let view = HomeViewController()
        var presenter: HomePresenterInterface = HomePresenter()
        var interactor: HomeInteractorInterface = HomeInteractor()

        view.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view
        interactor.presenter = presenter
        router.presenter = presenter
        let nc = UINavigationController(rootViewController: view)
        router.view = nc
        return nc
    }
    
    func navigateToMovies(data: MovieResult?, type: String) {
        let movieVC = self.view?.tabBarController?.viewControllers?[1] as? UINavigationController
        self.movieViewController = movieVC
        let movieViewInterface = movieVC?.visibleViewController as? MovieViewInterface
        movieViewInterface?.presenter?.configureMovies(data: data, type: type)
        view?.tabBarController?.selectedIndex = 1
    }
    
}

