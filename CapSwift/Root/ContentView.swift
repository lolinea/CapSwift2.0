//
//  ContentView.swift
//  CapSwift
//
//  Created by Caroline Ang on 04/09/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LevelView()
            .onAppear {
                Task { @MainActor in
                    if let window = NSApplication.shared.windows.first {
                        if !window.styleMask.contains(.fullScreen) {
                            window.toggleFullScreen(nil)
                        }
                    }
                }
            }
    }
}

#Preview {
    ContentView()
}
