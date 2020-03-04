//
//  PadResourcesProvider.swift
//  Padious
//
//  Created by Tomas Skypala on 04/03/2020.
//  Copyright © 2020 Tomas Skypala. All rights reserved.
//

import Foundation

struct PadResourcesProvider: PadResourcesProviding {

    private static let resourceName = "PadResources"
    private static let resourceExtension = "bundle"

    private static let imagesDirectoryName = "Images.bundle"
    private static let soundsDirectoryName = "Sounds.bundle"

    func getPadResources() -> [PadResource] {

        let soundFileNameURLDict = getFileNameURLDictionary(
            fromResourceWithName: Self.resourceName,
            directoryName: Self.soundsDirectoryName
        )

        let imageFileNameURLDict = getFileNameURLDictionary(
            fromResourceWithName: Self.resourceName,
            directoryName: Self.imagesDirectoryName
        )

        var padResources = [PadResource]()
        for (fileName, soundURL) in soundFileNameURLDict {
            guard let imageURL = imageFileNameURLDict[fileName] else { continue }

            padResources.append(.init(imageURL: imageURL, soundURL: soundURL))
        }

        return padResources
    }

    private func getFileNameURLDictionary(
        fromResourceWithName resourceName: String,
        directoryName: String
    ) -> [String: URL] {

        let resourceName = Self.resourceName
        guard
            let resourcesBundleURL = Bundle.main.url(
                forResource: resourceName,
                withExtension: Self.resourceExtension
            )
        else {
            fatalError("Pad resources not found under expected name \"\(resourceName)\".")
        }

        let resourceFolderURL = resourcesBundleURL.appendingPathComponent(directoryName, isDirectory: true)
        guard
            let allFileURLs = try? FileManager.default.contentsOfDirectory(
                at: resourceFolderURL,
                includingPropertiesForKeys: [],
                options: .init()
            )
        else {
            fatalError("No resources on path \(resourceFolderURL)")
        }

        return Dictionary(uniqueKeysWithValues: allFileURLs.map { url in (getFileName(from: url), url) })
    }

    private func getFileName(from fileURL: URL) -> String {
        return fileURL.deletingPathExtension().lastPathComponent
    }
}
