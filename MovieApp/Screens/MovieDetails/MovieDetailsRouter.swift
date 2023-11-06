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
    func navigateToCastDetails(castId: Int?)
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
    
    func navigateToCastDetails(castId: Int?) {
        let castDetailsVC = CastDetailsRouter.createModule(castId: castId)
        view?.navigationController?.pushViewController(castDetailsVC, animated: true)
        castDetailsVC.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.left"), style: .done, target: self, action: #selector(backButtonTapped(_:)))
        castDetailsVC.title = "Cast Details"
        castDetailsVC.navigationController?.navigationBar.tintColor = .white
    }
    
    @objc private func backButtonTapped(_ sender: UIViewController) {
        DispatchQueue.main.async { [weak self] in
            self?.view?.navigationController?.popViewController(animated: true)
        }
    }
}
