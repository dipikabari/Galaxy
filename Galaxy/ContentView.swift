//
//  ContentView.swift
//  Galaxy
//
//  Created by Dipika Bari on 23/01/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var earthProgress: CGFloat = 0.0
    @State private var earthRotation: CGFloat = 0.0
    @State private var moonProgress: CGFloat = 0.0
    @State private var sunScale: CGFloat = 1.0
    
    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size
            
            SolarSystem.sun(
                position: size.center,
                size: 70.0,
                scale: sunScale
            )
            .shadow(
                color: .yellow,
                radius: sunScale * 10.0
            )
            
            SolarSystem.earth(
                size: 50.0,
                rotation: earthRotation,
                moonOverlay: { moonSize in
                    SolarSystem.earthOverlay(
                        moonSize: moonSize,
                        progress: moonProgress,
                        path: Path.circle(
                            center: size.center,
                            size: size.applying(.init(scaleX: 0.6, y: 0.6))
                        )
                    )
                }
            )
            .pathAnimation(
                progress: earthProgress,
                path: Path.circle(
                    center: size.center,
                    size: size.applying(.init(scaleX: 0.6, y: 0.6))
                )
            )
        }
        .onAppear(perform: animation)
    }
    
    private func animation() {
        let earthDuration: CGFloat = 30
        withAnimation(.linear(duration: earthDuration).repeatForever(autoreverses: false)) {
            earthProgress = 1.0
        }
        withAnimation(.linear(duration: earthDuration / 8).repeatForever(autoreverses: false)) {
            earthRotation = 1.0
        }
        withAnimation(.linear(duration: (earthDuration / 6)).repeatForever(autoreverses: false)) {
            moonProgress = 1.0
        }
        withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
            sunScale = 1.1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .background(Color.blue)
    }
}
