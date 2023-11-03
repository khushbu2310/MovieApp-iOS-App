//
//  MovieDetailsRouter.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 02/11/23.
//

import Foundation
import UIKit

protocol MovieDetailsRouterInterface {
    var view: UIViewController? { get set }
    var presenter: MovieDetailsPresenterInterface? { get set }
    static func createModule(movieId: Int?) -> UIViewController
}

class MovieDetailsRouter: MovieDetailsRouterInterface {
    
    var view: UIViewController?
    var presenter: MovieDetailsPresenterInterface?
    
    static func createModule(movieId: Int? = nil) -> UIViewController {
        let router = MovieDetailsRouter()
        let view = MovieDetailsViewController()
        var presenter: MovieDetailsPresenterInterface = MovieDetailsPresenter(movieId: movieId)
        var interactor: MovieDetailsInteractorInterface = MovieDetailsInteractor()

        view.presenter = presenter 
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view
        interactor.presenter = presenter
        router.presenter = presenter
        router.view = view
        return view
    }
}
