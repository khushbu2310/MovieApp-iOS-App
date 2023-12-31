//
//  DataError.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 06/11/23.
//

import Foundation

enum DataError: Error {
    case badUrl, noData, invalidResponse, encodeError(Error), invalidData, decodeError(Error), serverError
}

