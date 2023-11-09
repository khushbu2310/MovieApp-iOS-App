//
//  HomeTests.swift
//  MovieAppTests
//
//  Created by Khushbuben Patel on 08/11/23.
//

import Foundation
import XCTest
@testable import MovieApp

final class HomeTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testHomeSuccess() {
        let presenter = HomePresenter()
        let interactor = HomeInteractor(presenter: presenter, movieRepo: MovieRepoMock())
        presenter.interactor = interactor
        interactor.getMovieData(type: EndPointMovie.topRatedMovie, movieType: .toprated, modelType: MovieResult.self)

        let result = presenter.responseMovieList.first(where: { $0.responseType == .toprated })?.data
        let error = presenter.error
        
        XCTAssertNotNil(result, "Data isnt fetched successfully")
        XCTAssertNil(error, "Error while fetchiing data")
        
    }
    
    func testHomeFailure() {
        let presenter = HomePresenter()
        let interactor = HomeInteractor(presenter: presenter, movieRepo: MovieRepoMock())
        presenter.interactor = interactor
        interactor.getMovieData(type: EndPointMovie.topRatedMovie, movieType: .toprated, modelType: CastEntity.self)

        let result = presenter.responseMovieList.first(where: { $0.responseType == .toprated })?.data
        let error = presenter.error
        
        XCTAssertNil(result, "Data fetched successfully")
        XCTAssertNotNil(error, "Error is not occurred")
    }
}
