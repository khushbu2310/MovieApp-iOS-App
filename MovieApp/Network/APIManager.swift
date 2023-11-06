//
//  APIManager.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 25/10/23.
//

import Foundation

protocol APIRouter {
    var host: String { get }
    var schema: String { get }
    var path: String { get }
    var method: String { get }
    var queryItems: [URLQueryItem] { get }
    var headers: [(String, String)] { get }
    var statusCode: Int { get }
    var body: Codable? { get }
}

typealias Handler<T> = (Result<T, APIRequestError>) -> Void

final class APIManager {
    static let shared = APIManager()
    private init() {}
    
    var request: URLRequest?
    
    func request<T: Codable> (modelType: T.Type, type: EndPointAPIType, completion: @escaping Handler<T>) {
        
        guard let url = type.url else {
            completion(.failure(.badUrl))
            return
        }
        
        if type.queryItems!.isEmpty == false {
            var urlComponents = URLComponents(string: url)
            urlComponents?.queryItems = type.queryItems
            
            request = URLRequest(url: (urlComponents?.url)!)
        } else {
            request = URLRequest(url: URL(string: url)!)
        }
        
        request?.httpMethod = type.methods
        request?.allHTTPHeaderFields = type.headers
                
        URLSession.shared.dataTask(with: request!) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.invalidData))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(.invalidResponse))
                return
            }

            do {
                let response = try JSONDecoder().decode(modelType, from: data)
                completion(.success(response))
            } catch {
                print("Decoding error in API Router: \(error)")
                completion(.failure(.decodeError(error)))
            }
        }.resume()
    }
}

