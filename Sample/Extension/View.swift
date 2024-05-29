//
//  View.swift
//  Sample
//
//  Created by Julian on 5/25/24.
//

import Foundation
import SwiftUI

extension View {
    
    // ListView 의 구분선 제거
    @ViewBuilder
    func hideListRowSeparator() -> some View {
        if #available(iOS 15.0, *) {
            self.listRowSeparator(.hidden)
        } else {
            self.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .listRowInsets(EdgeInsets(top: -1, leading: -1, bottom: -1, trailing: -1))
                .background(Color.white)
        }
    }
    
    func onRotate(perform action: @escaping (UIDeviceOrientation) -> Void) -> some View {
        self.modifier(DeviceRotationViewModifier(action: action))
    }
    
    // Skeleton View 
    func shimmering() -> some View {
        self.modifier(ShimmeringViewModifier())
    }
}
