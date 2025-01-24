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
            
        }
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
