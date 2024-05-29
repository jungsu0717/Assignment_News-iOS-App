//
//  SkeletonView.swift
//  Sample
//
//  Created by Julian on 5/29/24.
//

import Foundation
import SwiftUI

struct SkeletonContentsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            RoundedRectangle(cornerRadius: Dimensions.cornerRadiusMedium)
                .fill(Colors.emptyImage.opacity(0.3))
                .frame(height: Dimensions.skeltonImgHeight)
                .shimmering()
            
            RoundedRectangle(cornerRadius: Dimensions.cornerRadiusMedium)
                .fill(Colors.emptyImage.opacity(0.3))
                .frame(height: Dimensions.skeltonTitleHeight)
                .shimmering()
            RoundedRectangle(cornerRadius: Dimensions.cornerRadiusMedium)
                .fill(Colors.emptyImage.opacity(0.4))
                .frame(height: Dimensions.skeltonContentHeight)
                .shimmering()
        }
    }
}

