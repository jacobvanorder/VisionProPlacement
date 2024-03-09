//
//  VisionProPlacementApp.swift
//  VisionProPlacement
//
//  Created by Jacob Van Order on 3/9/24.
//

import SwiftUI

@main
struct VisionProPlacementApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }.immersionStyle(selection: .constant(.full), in: .full)
    }
}
