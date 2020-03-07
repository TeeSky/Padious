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

    let padResources: [PadResource]

    init() { // FIXME: make testable
        let soundFileNameURLDict = Self.getFileNameURLDictionary(
            fromResourceWithName: Self.resourceName,
            directoryName: Self.soundsDirectoryName
        )

        let imageFileNameURLDict = Self.getFileNameURLDictionary(
            fromResourceWithName: Self.resourceName,
            directoryName: Self.imagesDirectoryName
        )

        var padResources = [PadResource]()
        for (fileNameWithIndex, soundURL) in soundFileNameURLDict.sorted(by: { $0.0 < $1.0 }) {
            let fileName = Self.stripIndex(fromFileName: fileNameWithIndex)
            guard let imageURL = imageFileNameURLDict[fileName] else { continue }

            padResources.append(.init(imageURL: imageURL, soundURL: soundURL))
        }

        self.padResources = padResources
    }

    private static func getFileNameURLDictionary(
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

    private static func getFileName(from fileURL: URL) -> String {
        return fileURL.deletingPathExtension().lastPathComponent
    }

    private static func stripIndex(fromFileName fileName: String) -> String {
        guard let prefixSeparatingDashCharIndex = fileName.firstIndex(of: "-") else {
            fatalError("Unexpected file name format.")
        }

        return String(fileName.suffix(from: fileName.index(prefixSeparatingDashCharIndex, offsetBy: 1)))
    }
}
