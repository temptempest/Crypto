//
//  FileManagerError.swift
//  Crypto
//
//  Created by Victor  on 29.11.2022.
//

import Foundation

enum FileManagerError: LocalizedError {
    case errorSaving(imageName: String, error: Error)
    case errorCreatingDirectory(folderName:String, error: Error)
    
     var errorDescription: String? {
        switch self {
        case .errorSaving(let imageName, let error): return "Error saved image. ImageName \(imageName). \(error)"
        case .errorCreatingDirectory(let folderName, let error): return "Error creating directory. FolderName: \(folderName). \(error)"
        }
    }
}

