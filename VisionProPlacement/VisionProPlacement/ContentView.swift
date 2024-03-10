//
//  ContentView.swift
//  VisionProPlacement
//
//  Created by Jacob Van Order on 3/9/24.
//

import SwiftUI
import RealityKit

struct ContentView: View {
    
    
    private let assets: [Asset]

    @State private var showImmersiveSpace = false
    @State private var immersiveSpaceIsShown = false
    
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace

    var body: some View {
        HStack {
            ForEach(assets, id: \.self.assetName) { asset in
                AssetCardView(asset: asset)
                    .frame(width: 300, height: 400)
            }
        }
        .padding()
        .onChange(of: showImmersiveSpace) { _, newValue in
            Task {
                if newValue {
                    switch await openImmersiveSpace(id: "ImmersiveSpace") {
                    case .opened:
                        immersiveSpaceIsShown = true
                    case .error, .userCancelled:
                        fallthrough
                    @unknown default:
                        immersiveSpaceIsShown = false
                        showImmersiveSpace = false
                    }
                } else if immersiveSpaceIsShown {
                    await dismissImmersiveSpace()
                    immersiveSpaceIsShown = false
                }
            }
        }
    }
    
    internal init() {
        do {
            let assets = try Asset.allAssets()
            self.assets = assets
        } catch {
            print(error)
            self.assets = []
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
