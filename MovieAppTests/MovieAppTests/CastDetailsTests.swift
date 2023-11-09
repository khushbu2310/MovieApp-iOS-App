//
//  CastDetailsTests.swift
//  MovieAppTests
//
//  Created by Khushbuben Patel on 08/11/23.
//

import Foundation
@testable import MovieApp
import XCTest

final class CastDetailsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCastDetailsSuccess() {
        let presenter = CastDetailsPresenter(castId: 0)
        let interactor = CastDetailsInteractor(presenter: presenter, castRepo: MovieRepoMock())
        presenter.interactor = interactor
        interactor.getCastDetails(modelType: CastDetailsByIdEntity.self, type: EndPointCast.castDetailsById(id: 0))
        
        let result = presenter.castDetails
        let error = presenter.error
        
        XCTAssertNotNil(result, "Data is not fetched")
        XCTAssertNil(error, "Error occured")
    }

    func testCastDetailsFailure() {
        let presenter = CastDetailsPresenter(castId: 0)
        let interactor = CastDetailsInteractor(presenter: presenter, castRepo: MovieRepoMock())
        presenter.interactor = interactor
        interactor.getCastDetails(modelType: MovieTVDetailsModel.self, type: EndPointCast.castDetailsById(id: 0))
        
        let result = presenter.castDetails
        let error = presenter.error
        
        XCTAssertNil(result, "Data fetched successfully")
        XCTAssertNotNil(error, "Error is not occurred")
    }
    
    func testCastCombineSuccess() {
        let presenter = CastDetailsPresenter(castId: 0)
        let interactor = CastDetailsInteractor(presenter: presenter, castRepo: MovieRepoMock())
        presenter.interactor = interactor
        interactor.getCastDetails(modelType: CastMovieTVModel.self, type: EndPointCast.knownForCombine(id: 0))

        let result = presenter.castCombineDetails
        let error = presenter.error
        
        XCTAssertNotNil(result, "Data is not fetched successfully")
        XCTAssertNil(error, "Error is occurred")
    }
    
    func testCastCombineFailure() {
        let presenter = CastDetailsPresenter(castId: 0)
        let interactor = CastDetailsInteractor(presenter: presenter, castRepo: MovieRepoMock())
        presenter.interactor = interactor
        interactor.getCastDetails(modelType: VideoModel.self, type: EndPointCast.knownForCombine(id: 0))

        let result = presenter.castCombineDetails
        let error = presenter.error
        
        XCTAssertNil(result, "Data fetched successfully")
        XCTAssertNotNil(error, "Error is not occurred")
    }

    func testCastImageSuccess() {
        let presenter = CastDetailsPresenter(castId: 0)
        let interactor = CastDetailsInteractor(presenter: presenter, castRepo: MovieRepoMock())
        presenter.interactor = interactor
        interactor.getCastDetails(modelType: CastImagesByIdEntity.self, type: EndPointCast.castImagesById(id: 0))
        
        let result = presenter.castImageList
        let error = presenter.error
        
        XCTAssertNotNil(result, "Data is not fetched successfully")
        XCTAssertNil(error, "Error is occurred")
    }
    
    func testCastImageFailure() {
        let presenter = CastDetailsPresenter(castId: 0)
        let interactor = CastDetailsInteractor(presenter: presenter, castRepo: MovieRepoMock())
        presenter.interactor = interactor
        interactor.getCastDetails(modelType: CastDetailsByIdEntity.self, type: EndPointCast.castImagesById(id: 0))

        let result = presenter.castImageList
        let error = presenter.error
        
        XCTAssertNil(result, "Data fetched successfully")
        XCTAssertNotNil(error, "Error is not occurred")
    }
}
