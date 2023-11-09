//
//  CastDetailsRouter.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 03/11/23.
//

import Foundation
import UIKit

protocol CastDetailsRouterInterface {
    var view: UIViewController? { get set }
    var presenter: CastDetailsRouterToPresenterInterface? { get set }
    static func createModule(castId: Int?) -> UIViewController
}

class CastDetailsRouter: CastDetailsRouterInterface {
    var presenter: CastDetailsRouterToPresenterInterface?    
    var view: UIViewController?
        
    static func createModule(castId: Int?) -> UIViewController {
        let router = CastDetailsRouter()
        let view = CastDetailsViewController()
        var presenter: CastDetailsViewToPresenterInterface & CastDetailsInteractorToPresenterInterface & CastDetailsRouterToPresenterInterface = CastDetailsPresenter(castId: castId)
        var interactor: CastDetailsInteractorInterface = CastDetailsInteractor(presenter: presenter)
        
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
