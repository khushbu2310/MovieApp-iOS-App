//
//  MovieRouter.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 27/10/23.
//

import Foundation
import UIKit

typealias EntryPointMovie = MovieViewInterface & UIViewController

protocol MovieRouterInterface {
    var entry: EntryPointMovie? { get set }
    var presenter: MoviePresenterInterface? { get set }
    static func createModule() -> UIViewController
}

class MovieRouter: MovieRouterInterface {
    
    var entry: EntryPointMovie?
    var presenter: MoviePresenterInterface?

    static func createModule() -> UIViewController {
        let router = MovieRouter()
        var view = MovieViewController()
        var presenter: MoviePresenterInterface = MoviePresenter()
        var interactor: MovieInteractorInterface = MovieInteractor()
        
        view.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view
        interactor.presenter = presenter
        router.presenter = presenter
        router.entry = view
        return view
    }
}
