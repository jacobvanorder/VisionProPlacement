//
//  RotatingAssetView.swift
//  VisionProPlacement
//
//  Created by Jacob Van Order on 3/10/24.
//

import SwiftUI
import RealityKit

struct RotatingAssetView: View {
    
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
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geometry.size.width,
                           height: geometry.size.height,
                           alignment: .center)
                    .phaseAnimator([true, false]) { model, phase in
                        model
                            .animation(animation) { model in
                                model
                                    .rotation3DEffect(.degrees(phase ? 0 : 360), axis: .y)
                            }
                    }
            } placeholder: {
                ProgressView()
            }
        }
        .aspectRatio(asset.boundingBox.frameAspectRatio, contentMode: .fit)
    }
    
    internal init(duration: TimeInterval = 10.0,
                  speed: Double = 1.3,
                  asset: Asset) {
        self.duration = duration
        self.speed = speed
        self.asset = asset
    }
}

#Preview {
    RotatingAssetView(asset: try! Asset.allAssets().last!)
        .frame(width: 400.0)
        .border(.pink)
}
