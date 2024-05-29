//
//  SkeletonHeaderView.swift
//  Sample
//
//  Created by Julian on 5/29/24.
//

import Foundation
import SwiftUI

struct SkeletonHeaderView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: Dimensions.mediumPadding) {
            Color.clear.frame(height: 50)
            HStack {
                RoundedRectangle(cornerRadius: Dimensions.cornerRadiusMedium)
                    .fill(Colors.emptyImage.opacity(0.3))
                    .shimmering()
                    .frame(
                        width: Dimensions.skeltonHeaderTitleWidth,
                        height: Dimensions.skeltonHeaderTitleHeight
                    )
                Spacer()
            }
            HStack(alignment: .center, spacing: Dimensions.smallPadding) {
                Spacer()
                RoundedRectangle(cornerRadius: Dimensions.cornerRadiusMedium)
                    .fill(Colors.emptyImage.opacity(0.3))
                    .shimmering()
                    .frame(
                        width: Dimensions.skeltonHeaderToggleWidth,
                        height: Dimensions.skeltonHeaderToggleHeight
                    )
                RoundedRectangle(cornerRadius: Dimensions.cornerRadiusMedium)
                    .fill(Colors.emptyImage.opacity(0.3))
                    .shimmering()
                    .frame(
                        width: Dimensions.skeltonHeaderToggleWidth,
                        height: Dimensions.skeltonHeaderToggleHeight
                    )
            }
        }
    }
}

