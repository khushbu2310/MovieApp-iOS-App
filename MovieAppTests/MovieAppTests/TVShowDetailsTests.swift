//
//  TVShowDetailsTests.swift
//  MovieAppTests
//
//  Created by Khushbuben Patel on 08/11/23.
//

import Foundation
@testable import MovieApp
import XCTest

final class TVShowDetailsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testTVShowDetailsSuccess() {
        let presenter = TVShowDetailsPresenter(tvShowId: 0)
        let interactor = TVShowDetailsInteractor(presenter: presenter, tvShowRepo: MovieRepoMock())
        presenter.interactor = interactor
        interactor.getTVShowData(modelType: TVShowByIDEntity.self, type: EndPointTVShow.tvShowDetails(id: 0))
        
        let result = presenter.tvShowDetails
        let error = presenter.error
        
        XCTAssertNotNil(result, "Data is not fetched")
        XCTAssertNil(error, "Error occured")

    }

    func testTVShowDetailsFailure() {
        let presenter = TVShowDetailsPresenter(tvShowId: 0)
        let interactor = TVShowDetailsInteractor(presenter: presenter, tvShowRepo: MovieRepoMock())
        presenter.interactor = interactor
        interactor.getTVShowData(modelType: CastEntity.self, type: EndPointTVShow.tvShowDetails(id: 0))
        
        let result = presenter.tvShowDetails
        let error = presenter.error
        
        XCTAssertNil(result, "Data fetched successfully")
        XCTAssertNotNil(error, "Error is not occurred")
    }
    
    func testTVShowCastSuccess() {
        let presenter = TVShowDetailsPresenter(tvShowId: 0)
        let interactor = TVShowDetailsInteractor(presenter: presenter, tvShowRepo: MovieRepoMock())
        presenter.interactor = interactor
        interactor.getTVShowData(modelType: CastEntity.self, type: EndPointCast.tvShowsCastList(id: 0))
        
        let result = presenter.castList
        let error = presenter.error
        
        XCTAssertNotNil(result, "Data is not fetched successfully")
        XCTAssertNil(error, "Error is occurred")
    }
    
    func testTVShowCastFailure() {
        let presenter = TVShowDetailsPresenter(tvShowId: 0)
        let interactor = TVShowDetailsInteractor(presenter: presenter, tvShowRepo: MovieRepoMock())
        presenter.interactor = interactor
        interactor.getTVShowData(modelType: MovieTVDetailsModel.self, type: EndPointCast.tvShowsCastList(id: 0))
        
        let result = presenter.castList
        let error = presenter.error
        
        XCTAssertNil(result, "Data fetched successfully")
        XCTAssertNotNil(error, "Error is not occurred")
    }

    func testTVShowVideoSuccess() {
        let presenter = TVShowDetailsPresenter(tvShowId: 0)
        let interactor = TVShowDetailsInteractor(presenter: presenter, tvShowRepo: MovieRepoMock())
        presenter.interactor = interactor
        interactor.getTVShowData(modelType: VideoModel.self, type: EndPointTVShow.tvShowVideoDetails(id: 0))
        
        let result = presenter.videoDetails
        let error = presenter.error
        
        XCTAssertNotNil(result, "Data is not fetched successfully")
        XCTAssertNil(error, "Error is occurred")
    }
    
    func testTVShowVideoFailure() {
        let presenter = TVShowDetailsPresenter(tvShowId: 0)
        let interactor = TVShowDetailsInteractor(presenter: presenter, tvShowRepo: MovieRepoMock())
        presenter.interactor = interactor
        interactor.getTVShowData(modelType: MovieTVDetailsModel.self, type: EndPointTVShow.tvShowVideoDetails(id: 0))
        
        let result = presenter.videoDetails
        let error = presenter.error
        
        XCTAssertNil(result, "Data fetched successfully")
        XCTAssertNotNil(error, "Error is not occurred")
    }

}

