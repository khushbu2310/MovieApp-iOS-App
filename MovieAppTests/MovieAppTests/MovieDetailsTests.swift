//
//  MovieDetailsTests.swift
//  MovieAppTests
//
//  Created by Khushbuben Patel on 08/11/23.
//

import Foundation
@testable import MovieApp
import XCTest

final class  MovieDetailsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testMovieDetailsSuccess() {
        let presenter = MovieDetailsPresenter(movieId: 0)
        let interactor = MovieDetailsInteractor(presenter: presenter, movieRepo: MovieRepoMock())
        presenter.interactor = interactor
        interactor.getMovieData(modelType: MovieByIDEntity.self, type: EndPointMovie.movieDetails(id: 0))
        
        let result = presenter.movieDetails
        let error = presenter.error
        
        XCTAssertNotNil(result, "Data is not fetched")
        XCTAssertNil(error, "Error occured")

    }
    
    func testMovieDetailsFailure() {
        let presenter = MovieDetailsPresenter(movieId: 0)
        let interactor = MovieDetailsInteractor(presenter: presenter, movieRepo: MovieRepoMock())
        presenter.interactor = interactor
        interactor.getMovieData(modelType: CastEntity.self, type: EndPointMovie.movieDetails(id: 0))
        
        let result = presenter.movieDetails
        let error = presenter.error
        
        XCTAssertNil(result, "Data fetched successfully")
        XCTAssertNotNil(error, "Error is not occurred")
    }
    
    func testMovieCastSuccess() {
        let presenter = MovieDetailsPresenter(movieId: 0)
        let interactor = MovieDetailsInteractor(presenter: presenter, movieRepo: MovieRepoMock())
        presenter.interactor = interactor
        interactor.getMovieData(modelType: CastEntity.self, type: EndPointCast.moviesCastList(id: 0))
        
        let result = presenter.castList
        let error = presenter.error
        
        XCTAssertNotNil(result, "Data is not fetched successfully")
        XCTAssertNil(error, "Error is occurred")
    }
    
    func testMovieCastFailure() {
        let presenter = MovieDetailsPresenter(movieId: 0)
        let interactor = MovieDetailsInteractor(presenter: presenter, movieRepo: MovieRepoMock())
        presenter.interactor = interactor
        interactor.getMovieData(modelType: MovieTVDetailsModel.self, type: EndPointCast.moviesCastList(id: 0))
        
        let result = presenter.castList
        let error = presenter.error
        
        XCTAssertNil(result, "Data fetched successfully")
        XCTAssertNotNil(error, "Error is not occurred")
    }

    func testMovieVideoSuccess() {
        let presenter = MovieDetailsPresenter(movieId: 0)
        let interactor = MovieDetailsInteractor(presenter: presenter, movieRepo: MovieRepoMock())
        presenter.interactor = interactor
        interactor.getMovieData(modelType: VideoModel.self, type: EndPointMovie.movieVideoDetails(id: 0))
        
        let result = presenter.videoDetails
        let error = presenter.error
        
        XCTAssertNotNil(result, "Data is not fetched successfully")
        XCTAssertNil(error, "Error is occurred")
    }
    
    func testMovieVideoFailure() {
        let presenter = MovieDetailsPresenter(movieId: 0)
        let interactor = MovieDetailsInteractor(presenter: presenter, movieRepo: MovieRepoMock())
        presenter.interactor = interactor
        interactor.getMovieData(modelType: MovieTVDetailsModel.self, type: EndPointMovie.movieVideoDetails(id: 0))
        
        let result = presenter.videoDetails
        let error = presenter.error
        
        XCTAssertNil(result, "Data fetched successfully")
        XCTAssertNotNil(error, "Error is not occurred")
    }


}

