//
//  PathTranslationEffect.swift
//  Galaxy
//
//  Created by Dipika Bari on 24/01/2025.
//

import SwiftUI

struct PathTranslationEffect: GeometryEffect {
    var progress: CGFloat
    let path: Path
    
    var animatableData: CGFloat {
        get { progress }
        set { progress = newValue }
    }
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        let clampedProgress = max(0.0, min(progress, 1.0))
        let trimmedPath = path.trimmedPath(from: 0.0, to: clampedProgress)
        
        guard let point = trimmedPath.currentPoint else {
            return ProjectionTransform(.identity)
        }
        
        let transform = CGAffineTransform(
            translationX: point.x - (size.width / 2.0),
            y: point.y - (size.height / 2.0)
        )
        return ProjectionTransform(transform)
    }
}

