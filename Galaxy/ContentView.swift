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
            sun(
                position: size.center,
                size: 70.0
            )
            .shadow(
                color: .yellow,
                radius: sunScale * 10.0
            )
            
        }
    }
    
    private func sun(position: CGPoint, size: CGFloat) -> some View {
        Text("🌞")
            .font(.system(size: size))
            .position(position)
            .scaleEffect(
                CGSize(
                    width: sunScale,
                    height: sunScale
                )
            )
    }
    
}

//MARK: - CGSize+Extensions
extension CGSize {
    var center: CGPoint {
        return CGPoint(x: width / 2.0, y: height / 2.0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
