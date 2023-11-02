//
//  EndPointAPIType.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 25/10/23.
//

import Foundation

protocol EndPointAPIType {
    var path: String { get }
    var url: String? { get }
    var methods: String { get }
    var headers: [String: String]? { get }
    var queryItems: [URLQueryItem]? { get }
}
