//
//  RotatingModel3D.swift
//  VisionProPlacement
//
//  Created by Jacob Van Order on 3/10/24.
//

import SwiftUI
import RealityKit

struct RotatingModel3D<PlaceholderContent: View>: View {

    let duration: TimeInterval
    let speed: Double
    let assetName: String
    let axis: RotationAxis3D
    @ViewBuilder let placeholder: PlaceholderContent

    private let animation: Animation
        
    var body: some View {
        Model3D(named: assetName) { model in
            model
                .resizable()
                .aspectRatio(contentMode: .fit)
                .phaseAnimator([true, false]) { content, phase in
                    model
                        .animation(animation) { content in
                            content.rotation3DEffect(.degrees(phase ? -360 : 0), axis: axis)
                        }
                }
        } placeholder: {
            placeholder
        }
    }
    
    init(duration: TimeInterval = 10.0,
         speed: Double = 1.3,
         named assetName: String,
         axis: RotationAxis3D = .y,
         placeholder: () -> PlaceholderContent) {
        self.duration = duration
        self.speed = speed
        self.assetName = assetName
        self.axis = axis
        self.placeholder = placeholder()
        self.animation = Animation
                            .linear(duration: duration)
                            .speed(speed)
                            .repeatForever(autoreverses: false)
    }
}

#Preview {
    RotatingModel3D(named: "luigi",
                    placeholder: { ProgressView() })
    .frame(width: 200)
    .padding(100)
    .glassBackgroundEffect()
}
