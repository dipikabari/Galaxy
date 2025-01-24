//
//  SolarSystem.swift
//  Galaxy
//
//  Created by Dipika Bari on 24/01/2025.
//

import SwiftUI

struct SolarSystem {
    
    static func sun(position: CGPoint, size: CGFloat, scale: CGFloat) -> some View {
        Text("🌞")
            .font(.system(size: size))
            .position(position)
            .scaleEffect(
                CGSize(
                    width: scale,
                    height: scale
                )
            )
    }
    
    static func earth(size: CGFloat, rotation: CGFloat, moonOverlay: @escaping (CGFloat) -> some View ) -> some View {
        Text("🌍")
            .font(.system(size: size))
            .rotationEffect(.degrees(rotation * 360.0))
            .overlay(moonOverlay(size - 10.0))
    }
    
    static func earthOverlay(moonSize: CGFloat, progress: CGFloat, path: Path) -> some View {
        GeometryReader { proxy in
            let size = proxy.size
            let scaleFactor: CGFloat = 2.0
            
            Text("🌚")
                .font(.system(size: moonSize))
                .pathAnimation(
                    progress: progress,
                    path: Path.circle(
                        center: size.center,
                        size: size.applying(CGAffineTransform(scaleX: scaleFactor, y: scaleFactor))
                    )
                )
        }
    }
}
