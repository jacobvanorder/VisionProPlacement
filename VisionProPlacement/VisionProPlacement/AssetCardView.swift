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
            RotatingModel3D(named: asset.assetName) {
                ProgressView()
            }
            .frame(width: 200, height: 200)
            .padding(20)
            .background {
                RoundedRectangle(cornerRadius: 25.0)
                    .foregroundStyle(.tertiary)
            }
            Text(asset.displayName)
                .font(.title)
        }
        .padding(30)
        .glassBackgroundEffect()
    }
}

#Preview {
    HStack(spacing: 20) {
        ForEach(try! Asset.allAssets(), id: \.self.assetName) { asset in
            AssetCardView(asset: asset)
                .frame(width: 300, height: 400)
        }
    }
}
