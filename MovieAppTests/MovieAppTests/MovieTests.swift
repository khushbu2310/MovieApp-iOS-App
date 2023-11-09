//
//  MovieTests.swift
//  MovieAppTests
//
//  Created by Khushbuben Patel on 08/11/23.
//

import Foundation
import XCTest
@testable import MovieApp

final class MovieTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testMovieSuccess() {
        let presenter = MoviePresenter()
        let interactor = MovieInteractor(presenter: presenter, movieRepo: MovieRepoMock())
        presenter.interactor = interactor
        interactor.getMovieData(type: EndPointMovie.popularMovie, modelType: MovieResult.self)
        
        let result = presenter.movieList
        let error = presenter.error
        
        XCTAssertNotNil(result, "Data isnt fetched successfully")
        XCTAssertNil(error, "Error while fetchiing data")
        
        
    }
    
    func testMovieFailure() {
        let presenter = MoviePresenter()
        let interactor = MovieInteractor(presenter: presenter, movieRepo: MovieRepoMock())
        presenter.interactor = interactor
        interactor.getMovieData(type: EndPointMovie.topRatedMovie, modelType: CastEntity.self)
        
        let result = presenter.movieList
        let error = presenter.error
        
        XCTAssertNil(result, "Data fetched successfully")
        XCTAssertNotNil(error, "Error is not occurred")
    }
}
