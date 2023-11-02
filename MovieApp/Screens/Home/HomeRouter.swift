//
//  HomeRouter.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 26/10/23.
//

import Foundation
import UIKit

typealias EntryPointHome = HomeViewInterface & UIViewController

protocol HomeRouterInterface {
    var entry: EntryPointHome? { get set }
    var presenter: HomePresenterInterface? { get set }
    static func createModule() -> UIViewController
//    func navigateToMovieDetailScreen(with movieData: MovieResult)
}

class HomeRouter: HomeRouterInterface {
    var entry: EntryPointHome?
    var presenter: HomePresenterInterface?
    var homeView: HomeViewController = HomeViewController()
    
    static func createModule() -> UIViewController {
        let router = HomeRouter()
        var view = HomeViewController()
        var presenter: HomePresenterInterface = HomePresenter()
        var interactor: HomeInteractorInterface = HomeInteractor()

        view.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view
        interactor.presenter = presenter
        router.presenter = presenter
        router.entry = view
        return view
    }
    
//    func navigateToMovieDetailScreen(with movieData: MovieResult) {
//        let movieDetailVC = MovieDetailsViewController()
//        homeView.navigationController?.pushViewController(movieDetailVC, animated: true)
//    }
}

