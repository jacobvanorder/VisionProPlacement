//
//  ImmersiveView.swift
//  VisionProPlacement
//
//  Created by Jacob Van Order on 3/9/24.
//

import SwiftUI
import RealityKit

struct ImmersiveView: View {
    var body: some View {
        RealityView { content in }
    }
}

#Preview(immersionStyle: .full) {
    ImmersiveView()
}
