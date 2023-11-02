//
//  TVShowsRouter.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 27/10/23.
//

import Foundation
import UIKit

typealias EntryPointTvShow = TVShowsViewInterface & UIViewController

protocol TVShowsRouterInterface {
    var entry: EntryPointTvShow? { get set }
    var presenter: TVShowsPresenterInterface? { get set }
    static func createModule() -> UIViewController
}

class TVShowsRouter: TVShowsRouterInterface {
    var entry: EntryPointTvShow?
    var presenter: TVShowsPresenterInterface?

    static func createModule() -> UIViewController {
        let router = TVShowsRouter()
        var view = TVShowsViewController()
        var presenter: TVShowsPresenterInterface = TVShowsPresenter()
        var interactor: TVShowsInteractorInterface = TVShowsInteractor()
        
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
