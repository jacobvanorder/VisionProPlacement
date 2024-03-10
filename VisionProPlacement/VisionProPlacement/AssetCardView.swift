//
//  AssetCardView.swift
//  VisionProPlacement
//
//  Created by Jacob Van Order on 3/10/24.
//

import SwiftUI

struct AssetCardView: View {
    let asset: Asset
    
    var body: some View {
        VStack(spacing: 30) {
            RotatingAssetView(asset: asset)
                .padding(20.0)
                .background {
                    RoundedRectangle(cornerRadius: 25.0)
                        .foregroundStyle(Color.white.opacity(0.2))
                }
            Text(asset.displayName)
                .font(.title)
        }
        .padding(30)
        .glassBackgroundEffect()
    }
}

#Preview {
    AssetCardView(asset: try! Asset.allAssets().first!)
        .frame(width: 300, height: 400)
}
