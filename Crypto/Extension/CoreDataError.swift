//
//  CoreDataError.swift
//  Crypto
//
//  Created by Victor  on 29.11.2022.
//

import Foundation

enum CoreDataError: LocalizedError {
    case errorLoading(Error)
    case errorFetching(Error)
    case errorSaving(Error)
    
     var errorDescription: String? {
        switch self {
        case .errorFetching(let error): return "Error fetching Portfolio Entities. \(error)"
        case .errorLoading(let error): return "Eror loading Core Data: \(error)"
        case .errorSaving(let error): return "Error saving to Core Data. \(error)"
        }
    }
}
