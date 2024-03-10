//
//  RotatingAssetView.swift
//  VisionProPlacement
//
//  Created by Jacob Van Order on 3/10/24.
//

import SwiftUI
import RealityKit

struct RotatingAssetView: View {

    @State var appear: Bool = false
    
    let duration: TimeInterval
    let speed: Double
    
    let asset: Asset
    
    var body: some View {
        GeometryReader { geometry in
            Model3D(named: asset.assetName) { model in
                let animation = Animation
                    .linear(duration: duration)
                    .speed(speed)
                    .repeatForever(autoreverses: false)
                model
                    .resizable()
                    .aspectRatio(asset.boundingBox.frameAspectRatio, contentMode: .fit)
                    .animation(animation) { model in
                        model
                            .rotation3DEffect(.degrees(appear ? -360 : 0), axis: .y)
                            .onAppear {
                                appear = true
                            }
                    }
            } placeholder: {
                ProgressView()
            }
        }
        .aspectRatio(asset.boundingBox.frameAspectRatio, contentMode: .fit)
    }
    
    internal init(appear: Bool = false,
                  duration: TimeInterval = 10.0,
                  speed: Double = 1.3,
                  asset: Asset) {
        self.appear = appear
        self.duration = duration
        self.speed = speed
        self.asset = asset
    }
}

#Preview {
    RotatingAssetView(asset: try! Asset.allAssets().first!)
        .frame(width: 400.0)
}
