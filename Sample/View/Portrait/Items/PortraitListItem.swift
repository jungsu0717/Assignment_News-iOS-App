//
//  PortraitListItem.swift
//  Sample
//
//  Created by Julian on 5/25/24.
//

import Foundation
import SwiftUI

struct PortraitListItem: View {
    
    var itemDetail: ItemDetail
    
    init(_ itemDetail : ItemDetail) {
        self.itemDetail = itemDetail
    }
    
    
    var body: some View {
        HStack(spacing: Dimensions.zeroPadding) {
            ImageView(_imageUrl: itemDetail.urlToImage)
                .frame(
                    width: Dimensions.listCardImageWidth,
                    height: Dimensions.listCardImageHeight,
                    alignment: .center
                )
                .clipShape(RoundedRectangle(cornerRadius: Dimensions.cornerRadiusSmall))
            if let url = itemDetail.urlToImage, !url.isEmpty {}
            else { Divider() }
            Spacer()
            VStack(alignment: .leading, spacing: Dimensions.smallPadding) {
                if let title = itemDetail.title {
                    Text(title)
                        .font(Fonts.titleLarge)
                        .foregroundColor(itemDetail.isChecked ?? false ? Color.newsTitleRed : Colors.title)
                        .lineLimit(1)
                        .truncationMode(.tail)
                }
                if let description = itemDetail.description {
                    Text(description)
                        .font(Fonts.contentsLarge)
                        .foregroundColor(Colors.content)
                        .lineLimit(1)
                        .truncationMode(.tail)
                }
                HStack {
                    Spacer()
                    
                    /*
                     * 날짜형식
                    Label(itemDetail.getPublishedAt, systemImage:  SFSymbols.calendar)
                        .font(Fonts.dateLarge)
                        .foregroundColor(Colors.content)
                        .labelStyle(.titleAndIcon)
                        .padding(.top, Dimensions.smallPadding)
                     */
                    Label(itemDetail.getPublishedAtDisplay, systemImage: SFSymbols.clockFill)
                        .font(Fonts.dateLarge)
                        .foregroundColor(Colors.content)
                        .labelStyle(.titleAndIcon)
                        .padding(.top, Dimensions.smallPadding)
                }
            }
            .padding(.trailing, Dimensions.mediumPadding)
            .frame(maxHeight: Dimensions.cardContentHeight)
        }
        .frame(height: Dimensions.cardContentHeight)
        .background(Colors.background)
        .clipShape(RoundedRectangle(cornerRadius: Dimensions.cornerRadiusSmall))
        .shadow(radius: Dimensions.shadowSmall)
    }
}

#Preview {
    PortraitListItem(ItemDetail.getDummy())
}
