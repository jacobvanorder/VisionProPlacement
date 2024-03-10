//
//  RotatingModel3D.swift
//  VisionProPlacement
//
//  Created by Jacob Van Order on 3/10/24.
//

import SwiftUI
import RealityKit

struct RotatingModel3D: View {

    @State var appear: Bool = false
    
    let duration: TimeInterval
    let speed: Double
    
    let named: String
    
    var body: some View {
        Model3D(named: named) { model in
            let animation = Animation
                .linear(duration: duration)
                .speed(speed)
                .repeatForever(autoreverses: false)
            model
                .resizable()
                .animation(animation) { model in
                    model
                        .animation(animation,
                                   body: { model in
                            model
                                .rotation3DEffect(.degrees(appear ? -360 : 0), axis: .y)
                        })
                        .onAppear {
                            appear = true
                        }
                }
        } placeholder: {
            ProgressView()
        }
        .aspectRatio(contentMode: .fit)
    }
    
    internal init(appear: Bool = false,
                  duration: TimeInterval = 10.0,
                  speed: Double = 1.3,
                  named: String) {
        self.appear = appear
        self.duration = duration
        self.speed = speed
        self.named = named
    }
}

#Preview {
    RotatingModel3D(named: "sculpture")
        .frame(width: 300)
}
