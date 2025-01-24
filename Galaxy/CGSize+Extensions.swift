//
//  CGSize+Extensions.swift
//  Galaxy
//
//  Created by Dipika Bari on 24/01/2025.
//

import CoreGraphics

extension CGSize {
    var center: CGPoint {
        return CGPoint(x: width / 2.0, y: height / 2.0)
    }
}
