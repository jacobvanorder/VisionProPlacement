//
//  Asset.swift
//  VisionProPlacement
//
//  Created by Jacob Van Order on 3/10/24.
//

import Foundation

struct Asset: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case displayName = "display_name"
        case assetName = "asset_name"
        case boundingBox = "bounding_box"
    }
    
    struct BoundingBox: Decodable {
        let width: CGFloat
        let height: CGFloat
        let depth: CGFloat
        
        var frameAspectRatio: CGFloat {
            return max(width, depth) / height
        }
    }
    
    let displayName: String
    let assetName: String
    let boundingBox: BoundingBox
}

extension Asset {
    
    enum AssetError: Error {
        case badData
    }
    
    static func allAssets() throws -> [Asset] {
        guard let dataURL = Bundle.main.url(forResource: "assets", withExtension: "json") else {
            throw AssetError.badData
        }
        let decoder = JSONDecoder()
        let data = try Data(contentsOf: dataURL)
        return try decoder.decode([Asset].self, from: data)
    }
}
