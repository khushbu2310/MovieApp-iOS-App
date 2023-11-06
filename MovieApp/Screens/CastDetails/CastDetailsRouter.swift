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
    var presenter: CastDetailsPresenterInterface? { get set }
    static func createModule(castId: Int?) -> UIViewController
}

class CastDetailsRouter: CastDetailsRouterInterface {
    var view: UIViewController?
    var presenter: CastDetailsPresenterInterface?
        
    static func createModule(castId: Int?) -> UIViewController {
        let router = CastDetailsRouter()
        let view = CastDetailsViewController()
        var presenter: CastDetailsPresenterInterface = CastDetailsPresenter(castId: castId)
        var interactor: CastDetailsInteractorInterface = CastDetailsInteractor()
        
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
