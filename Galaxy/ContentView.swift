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
            
            let earthPath = Path.circle(
                center: size.center,
                size: size.applying(.init(scaleX: 0.6, y: 0.6))
            )
            
            let moonPath = Path.circle(
                center: size.center,
                size: size.applying(.init(scaleX: 0.3, y: 0.3))
            )

            // Draw the path for tracing
            earthPath.stroke(Color.white.opacity(0.5), lineWidth: 1)
                
            // Add celestial bodies
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
                        path: moonPath
                    )
                }
            )
            .pathAnimation(
                progress: earthProgress,
                path: earthPath
            )
        }
        .onAppear(perform: animation)
    }
    
    private func animation() {
        let earthDuration: CGFloat = 60
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
