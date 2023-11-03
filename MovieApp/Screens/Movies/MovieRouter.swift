//
//  MovieRouter.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 27/10/23.
//

import Foundation
import UIKit

protocol MovieRouterInterface {
    var view: UINavigationController? { get set }
    var presenter: MoviePresenterInterface? { get set }
    static func createModule() -> UINavigationController
    func navigateToMovieDetails(movieId: Int?)
}

class MovieRouter: MovieRouterInterface {
    var view: UINavigationController?
    var presenter: MoviePresenterInterface?
    
    static func createModule() -> UINavigationController {
        let router = MovieRouter()
        let view = MovieViewController()
        var presenter: MoviePresenterInterface = MoviePresenter()
        var interactor: MovieInteractorInterface = MovieInteractor()
        
        view.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view
        interactor.presenter = presenter
        router.presenter = presenter
        let navigationController = UINavigationController(rootViewController: view)
        router.view = navigationController
        return navigationController
        
    }
    
    func navigateToMovieDetails(movieId: Int?) {
        let movieDetailsVC = MovieDetailsRouter.createModule(movieId: movieId)
        view?.pushViewController(movieDetailsVC, animated: true)
        view?.navigationBar.prefersLargeTitles = false
        movieDetailsVC.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.left"), style: .done, target: self, action: #selector(backButtontapped(_:)))
        movieDetailsVC.title = "Movie Details"
        movieDetailsVC.navigationController?.navigationBar.tintColor = .white
    }
    
    @objc private func backButtontapped(_ sender: UIViewController) {
        DispatchQueue.main.async { [weak self] in
            self?.view?.navigationBar.prefersLargeTitles = true
            self?.view?.popViewController(animated: true)
        }
        
    }
}
