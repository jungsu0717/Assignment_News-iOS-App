//
//  SplashView.swift
//  Sample
//
//  Created by Julian on 5/26/24.
//

import SwiftUI

struct SplashView: View {
    
    @State private var animationValue = 0
    
    var body: some View {
        
        ZStack(alignment: .center) {
            Colors.splashBg.edgesIgnoringSafeArea(.all)
            
            Image(systemName: SFSymbols.splashIcon)
                .foregroundColor(Colors.splashIcon)
                .symbolEffect(.bounce, value: animationValue)
                .font(Fonts.splashIcon)
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                animationValue += 1
            }
        }
    }
}

#Preview {
    SplashView()
}

