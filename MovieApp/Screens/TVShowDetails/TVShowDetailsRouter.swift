//
//  TVShowDetailsRouter.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 03/11/23.
//

import Foundation
import UIKit

protocol TVShowDetailsRouterInterface {
    var view: UIViewController? { get set }
    var presenter: TVShowDetailsRouterToPresenterInterface? { get set }
    static func createModule(tvShowId: Int?) -> UIViewController
    func navigateToCastDetails(castId: Int?)
}

class TVShowDetailsRouter: TVShowDetailsRouterInterface {
    var view: UIViewController?
    var presenter: TVShowDetailsRouterToPresenterInterface?
    
    static func createModule(tvShowId: Int? = nil) -> UIViewController {
        let router = TVShowDetailsRouter()
        let view = TVShowDetailsViewController()
        var presenter: TVShowDetailsViewToPresenterInterface & TVShowDetailsInteractorToPresenterInterface & TVShowDetailsRouterToPresenterInterface = TVShowDetailsPresenter(tvShowId: tvShowId)
        var interactor: TVShowDetailsInteractorInterface = TVShowDetailsInteractor(presenter: presenter)
        
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
