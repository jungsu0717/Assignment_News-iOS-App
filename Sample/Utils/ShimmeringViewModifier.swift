//
//  ShimmeringViewModifier.swift
//  Sample
//
//  Created by Julian on 5/29/24.
//

import Foundation
import SwiftUI

struct ShimmeringViewModifier: ViewModifier {
    @State private var phase: CGFloat = 0

    func body(content: Content) -> some View {
            content
                .overlay(
                    GeometryReader { geometry in
                        Rectangle()
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(stops: [
                                        .init(color: Colors.emptyImage.opacity(0), location: 0),
                                        .init(color: Colors.emptyImage.opacity(0.8), location: 0.5),
                                        .init(color: Colors.emptyImage.opacity(0), location: 1)
                                    ]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .offset(x: self.phase * geometry.size.width, y: 0)
                            .frame(width: geometry.size.width, height: geometry.size.height)
                    }
                )
                .mask(content)
                .onAppear {
                    withAnimation(Animation.linear(duration: 1.5).repeatForever(autoreverses: false)) {
                        self.phase = 1
                    }
                }
        }
}
