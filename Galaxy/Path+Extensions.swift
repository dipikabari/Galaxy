//
//  Path+Extensions.swift
//  Galaxy
//
//  Created by Dipika Bari on 24/01/2025.
//

import SwiftUI

extension Path {
    static func circle(center: CGPoint, size: CGSize) -> Self {
        Path { path in
            path.addArc(
                center: center,
                radius: size.width / 2.0,
                startAngle: .zero,
                endAngle: .degrees(360.0),
                clockwise: false
            )
        }
    }
}
