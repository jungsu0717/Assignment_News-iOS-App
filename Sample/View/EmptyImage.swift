//
//  EmptyImage.swift
//  Sample
//
//  Created by Julian on 5/25/24.
//

import Foundation
import SwiftUI

struct EmptyImage: View {
    
    var body: some View {
        
        ZStack(alignment: .center) {
            Colors.background.edgesIgnoringSafeArea(.all)
            VStack(alignment: .center, 
                   spacing: Dimensions.zeroPadding)
            {
                Image(systemName: SFSymbols.emptyImage)
                    .foregroundColor(Colors.emptyImage)
                    .font(Fonts.emptyImage)
                Text(Strings.emptyImage)
                    .font(Fonts.emptyText)
                    .foregroundColor(Colors.emptyImage)
            }
        }
        
    }
}

#Preview {
    EmptyImage()
}
