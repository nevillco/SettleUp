//
//  DataService.swift
//  SettleUp
//
//  Created by Connor Neville on 3/22/18.
//  Copyright © 2018 Connor Neville. All rights reserved.
//

import Foundation

private extension FileManager {

    var documentsDirectory: URL {
        let directories = urls(for: .documentDirectory, in: .userDomainMask)
        guard let directory = directories.first else {
            fatalError("Couldn’t get the documents directory for the current user")
        }
        return directory
    }

}

final class DataService {

    private static let dataFileName = "categories"
    private static let dataFileExtension = "json"

    private var documentsFileURL: URL {
        return FileManager.default.documentsDirectory
            .appendingPathComponent(DataService.dataFileName)
            .appendingPathExtension(DataService.dataFileExtension)
    }

    private var bundleFileURL: URL {
        guard let url = Bundle.main.url(
            forResource: DataService.dataFileName,
            withExtension: DataService.dataFileExtension) else {
                fatalError("Couldn’t get the URL for the default data file")
        }
        return url
    }

    private var documentsFileExists: Bool {
        return FileManager.default.fileExists(atPath: documentsFileURL.path)
    }

    typealias DataFetchCompletion = (Result<[Category]>) -> Void
    func fetchData(completion: @escaping DataFetchCompletion) {
        initializeDocumentsFileIfNecessary { initializationError in
            switch initializationError {
            case let .some(error):
                completion(.failure(error))
            case .none:
                do {
                    let data = try Data(contentsOf: self.documentsFileURL)
                    let categories = try JSONDecoder().decode(Array<Category>.self, from: data)
                    completion(.success(categories))
                }
                catch let error {
                    completion(.failure(error))
                }
            }
        }
    }

    typealias DocumentsInitializationCompletion = (Error?) -> Void
    private func initializeDocumentsFileIfNecessary(completion: @escaping DocumentsInitializationCompletion) {
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

}
