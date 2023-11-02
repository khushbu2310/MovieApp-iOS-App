//
//  ErrorEnum.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 28/10/23.
//

import Foundation

enum DataError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case network(Error?)
}
