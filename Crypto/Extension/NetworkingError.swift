//
//  NetworkingError.swift
//  Crypto
//
//  Created by Victor  on 29.11.2022.
//

import Foundation

enum NetworkingError: LocalizedError {
    case badURL(url:URL)
    case badUrlResponse(url:URL)
    case timedOut(url:URL)
    case unknown
    
    var errorDescription: String? {
        switch self {
        case .badUrlResponse(url: let url): return "[🔥] Bad response from url: \(url)"
        case .badURL(url: let url): return "[🔥] Bad url: \(url)"
        case .timedOut(url: let url): return "[🔥] TimedOut: \(url)"
        case .unknown: return "[⚠️] Unknown error occured"
        }
    }
}

