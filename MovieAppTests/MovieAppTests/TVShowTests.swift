//
//  TVShowTests.swift
//  MovieAppTests
//
//  Created by Khushbuben Patel on 08/11/23.
//

import Foundation
import XCTest
@testable import MovieApp

final class TVShowTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testTVShowSuccess() {
        let presenter = TVShowsPresenter()
        let interactor = TVShowsInteractor(presenter: presenter, tvShowRepo: MovieRepoMock())
        presenter.interactor = interactor
        
        interactor.getPopularTVShow(type: EndPointTVShow.popularTVShows, modelType: TVShowResult.self)
        
        let result = presenter.popularTVShowList
        let error = presenter.error
        
        XCTAssertNotNil(result, "Data is not fetched")
        XCTAssertNil(error, "Error occured")
        
    }
    
    func testTVShowFailure() {
        let presenter = TVShowsPresenter()
        let interactor = TVShowsInteractor(presenter: presenter, tvShowRepo: MovieRepoMock())
        presenter.interactor = interactor
        
        interactor.getPopularTVShow(type: EndPointTVShow.popularTVShows, modelType: CastEntity.self)
        
        let result = presenter.popularTVShowList
        let error = presenter.error
        
        XCTAssertNil(result, "Data fetched successfully")
        XCTAssertNotNil(error, "Error is not occurred")
    }
}

