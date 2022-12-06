//
//  LocalFileManager.swift
//  Crypto
//
//  Created by Victor  on 29.11.2022.
//

import Foundation
import SwiftUI

class LocalFileManager {
    
    static let instance = LocalFileManager()
    private init() { }
    
    private let fileManager = FileManager.default
    
    func saveImage(image: UIImage, imageName: String, folderName: String) {
        
        //create folder
        createFolderIfNeeded(folderName: folderName)
        
        //get path for image
        guard let data = image.pngData(),
              let url = getURLForImage(imageName: imageName, folderName: folderName )
        else { return }
        
        //save image to path
        do {
            try data.write(to: url)
        } catch let error {
            print(FileManagerError.errorSaving(imageName: imageName, error: error).localizedDescription)
        }
    }
    
    func getImage(imageName:String, folderName: String) -> UIImage? {
        guard
            let url = getURLForImage(imageName: imageName, folderName: folderName),
            fileManager.fileExists(atPath: url.path) else {
            return nil
        }
        return UIImage(contentsOfFile: url.path)
    }
    
    private func createFolderIfNeeded(folderName:String) {
        guard let url = getURLForFolder(folderName: folderName) else { return }
        if !fileManager.fileExists(atPath: url.path) {
            do {
                try fileManager.createDirectory(at: url, withIntermediateDirectories: true)
            } catch let error {
                print(FileManagerError.errorCreatingDirectory(folderName: folderName, error: error).localizedDescription)
            }
        }
    }
    
    private func getURLForFolder(folderName: String ) -> URL? {
        guard let url = fileManager.urls(for: .cachesDirectory, in: .userDomainMask).first else {
            return nil
        }
        return url.appendingPathComponent(folderName)
    }
    
    private func getURLForImage(imageName: String, folderName: String) -> URL? {
        guard let folderURL = getURLForFolder(folderName: folderName) else {
            return nil
        }
        return folderURL.appendingPathComponent(imageName + ".png")
    }
}

