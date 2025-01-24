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
}
