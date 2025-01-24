//
//  View+PathAnimation.swift
//  Galaxy
//
//  Created by Dipika Bari on 24/01/2025.
//

import SwiftUI

extension View {
    func pathAnimation(progress: CGFloat, path: Path) -> some View {
        self.modifier(PathTranslationEffect(progress: progress, path: path))
    }
}
