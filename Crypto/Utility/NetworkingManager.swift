//
//  NetworkingManager.swift
//  Crypto
//
//  Created by Victor  on 29.11.2022.
//

import Foundation
import Combine

final class NetworkingManager {
    
    private static let session = URLSession.shared
    
    static func download(url:URL) -> AnyPublisher<Data, Error> {
        return session.dataTaskPublisher(for: url)
            .tryMap({ try handleUrlResponse(output: $0, url: url) })
            .retry(3)
            .eraseToAnyPublisher()
    }
    
    private static func handleUrlResponse(output: URLSession.DataTaskPublisher.Output, url:URL) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw NetworkingError.badUrlResponse(url: url) //URLError(.badServerResponse)
        }
        return output.data
    }
    
    static func handleCompletion(completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
             break
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
}

