//
//  ContentView.swift
//  Sample
//
//  Created by Julian on 5/24/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var vm = ItemViewModel()
    
    var body: some View {
        NavigationStack {
            if !vm.items.isEmpty {
                Group {
                    // 가로 모드
                    if (vm.orientation.isLandscape) {
                        LandscapeView(vm: vm)
                    }
                    // flat 모드일 경우
                    else if (vm.orientation.isFlat) {
                        if (vm.beforeOrientation.isLandscape) { LandscapeView(vm: vm) }
                        else { PortraitView(vm: vm) }
                    }
                    // Portrait or Unknown
                    else {
                        PortraitView(vm: vm)
                    }
                }.onRotate { newOrientation in
                    vm.setOrientation(_orientation: newOrientation)
                }
            } else {
                ProgressView()
            }
        }
    }
}

#Preview {
    ContentView()
}

