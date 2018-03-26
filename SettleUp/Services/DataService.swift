//
//  DataService.swift
//  SettleUp
//
//  Created by Connor Neville on 3/22/18.
//  Copyright © 2018 Connor Neville. All rights reserved.
//

import Foundation

final class DataService {

    typealias DocumentsInitializationCompletion = (Error?) -> Void
    typealias DataFetchCompletion = (Result<[Category]>) -> Void

    private static let dataFileName = "categories"
    private static let dataFileExtension = "json"

    func fetchData(shouldForceInitialize: Bool = false,
                   completion: @escaping DataFetchCompletion) {
        let initializationFunction = shouldForceInitialize ?
            self.initializeDocumentsFileIfNecessary : self.forceInitializeDocumentsFile
        initializationFunction { initializationError in
            switch initializationError {
            case let .some(error):
                completion(.failure(error))
            case .none:
                do {
                    let data = try Data(contentsOf: self.documentsFileURL)
                    let categories = try JSONDecoder().decode([Category].self, from: data)
                    completion(.success(categories))
                }
                catch let error {
                    completion(.failure(error))
                }
            }
        }
    }

}

// MARK: URLs
private extension DataService {

    var documentsFileURL: URL {
        return FileManager.default.documentsDirectory
            .appendingPathComponent(DataService.dataFileName)
            .appendingPathExtension(DataService.dataFileExtension)
    }

    private var documentsFileExists: Bool {
        return FileManager.default.fileExists(atPath: documentsFileURL.path)
    }

    var bundleFileURL: URL {
        guard let url = Bundle.main.url(
            forResource: DataService.dataFileName,
            withExtension: DataService.dataFileExtension) else {
                fatalError("Couldn’t get the URL for the default data file")
        }
        return url
    }

}

// MARK: Initializing the Documents URL
private extension DataService {

    func initializeDocumentsFileIfNecessary(completion: @escaping DocumentsInitializationCompletion) {
        guard !documentsFileExists else {
            completion(nil)
            return
        }
        do {
            try FileManager.default.copyItem(at: bundleFileURL, to: documentsFileURL)
            completion(nil)
        }
        catch let error {
            completion(error)
        }
    }

    func forceInitializeDocumentsFile(completion: @escaping DocumentsInitializationCompletion) {
        if documentsFileExists {
            do {
                try FileManager.default.removeItem(at: documentsFileURL)
            }
            catch let error {
                completion(error)
                return
            }
        }
        do {
            try FileManager.default.copyItem(at: bundleFileURL, to: documentsFileURL)
            completion(nil)
        }
        catch let error {
            completion(error)
        }
    }

}

// MARK: FileManager Documents Directory
private extension FileManager {

    var documentsDirectory: URL {
        let directories = urls(for: .documentDirectory, in: .userDomainMask)
        guard let directory = directories.first else {
            fatalError("Couldn’t get the documents directory for the current user")
        }
        return directory
    }

}
