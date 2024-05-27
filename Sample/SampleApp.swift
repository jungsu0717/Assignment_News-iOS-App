//
//  SampleApp.swift
//  Sample
//
//  Created by Julian on 5/24/24.
//

import SwiftUI

@main
struct SampleApp: App {
    
    @State private var isSplashScreenShown = true
    
    var body: some Scene {
        
        WindowGroup {
            if isSplashScreenShown {
                SplashView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            withAnimation {
                                isSplashScreenShown = false // 스플래시 화면을 닫고 메인 뷰로 전환
                            }
                        }
                    }
            } else {
                // 스플래시 화면이 닫힌 후에 메인 뷰를 표시
                ContentView()
            }
        }
    }
}
