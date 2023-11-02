//
//  MovieDetailsRouter.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 02/11/23.
//

import Foundation
import UIKit

protocol MovieDetailsRouterInterface {
    static func createModule(with movie: MovieByIDEntity) -> UIViewController?
}

class MovieDetailsRouter: MovieDetailsRouterInterface {
    static func createModule(with movie: MovieByIDEntity) -> UIViewController? {
        return UIViewController()
    }
}
