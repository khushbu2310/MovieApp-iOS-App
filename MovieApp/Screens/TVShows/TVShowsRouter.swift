//
//  TVShowsRouter.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 27/10/23.
//

import Foundation
import UIKit

protocol TVShowsRouterInterface {
    var view: UINavigationController? { get set }
    var presenter: TVShowsPresenterInterface? { get set }
    static func createModule() -> UINavigationController
    func navigateToTVShowDetails(tvShowId: Int?)
}

class TVShowsRouter: TVShowsRouterInterface {
    var view: UINavigationController?
    var presenter: TVShowsPresenterInterface?

    static func createModule() -> UINavigationController {
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
        let navigationController = UINavigationController(rootViewController: view)
        router.view = navigationController
        return navigationController
    }
    
    func navigateToTVShowDetails(tvShowId: Int?) {
        let tvShowDetailsVC = TVShowDetailsRouter.createModule(tvShowId: tvShowId)
        view?.pushViewController(tvShowDetailsVC, animated: true)
        view?.navigationBar.prefersLargeTitles = true
        tvShowDetailsVC.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.left"), style: .done, target: self, action: #selector(backButtonTapped(_:)))
        tvShowDetailsVC.title = "TVShow Details"
        tvShowDetailsVC.navigationController?.navigationBar.tintColor = .white
    }
    
    @objc private func backButtonTapped(_ sender: UIViewController) {
        DispatchQueue.main.async { [weak self] in
            self?.view?.navigationBar.prefersLargeTitles = true
            self?.view?.popViewController(animated: true)
        }
    }
}
