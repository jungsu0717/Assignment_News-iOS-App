//
//  LandscapeGridItem.swift
//  Sample
//
//  Created by Julian on 5/26/24.
//

import SwiftUI

struct LandscapeGridItem: View {
    
    var itemDetail: ItemDetail
    
    init(_ itemDetail : ItemDetail) {
        self.itemDetail = itemDetail
    }
    
    var body: some View {
        
        HStack(alignment: .center) {
            ImageView(_imageUrl: itemDetail.urlToImage)
                .frame(
                    width: Dimensions.listCardImagePixelHeight.pixelsToPoints(),
                    height: Dimensions.listCardImagePixelHeight.pixelsToPoints(),
                    alignment: .center
                )
                .clipShape(RoundedRectangle(cornerRadius: Dimensions.cornerRadiusSmall))
            if let url = itemDetail.urlToImage, !url.isEmpty {}
            else { Divider() }
            Spacer(minLength: Dimensions.zeroPadding)
            VStack(alignment: .leading, spacing: Dimensions.tinyPadding) {
                if let title = itemDetail.title, !title.isEmpty {
                    Text(title)
                        .font(Fonts.titleSmall)
                        .foregroundColor(Colors.title)
                        .lineLimit(1)
                        .truncationMode(.tail)
                }
                if let description = itemDetail.description, !description.isEmpty {
                    Text(description)
                        .font(Fonts.contentsSmall)
                        .foregroundColor(Colors.content)
                        .lineLimit(1)
                        .truncationMode(.tail)
                }
                
                HStack {
                    Spacer()
                    HStack(spacing: Dimensions.smallPadding) {
                        Image(systemName: SFSymbols.clockFill)
                            .resizable()
                            .scaledToFit()
                            .frame(width: Dimensions.clockSmallWidth)
                        Text(itemDetail.getPublishedAtDisplay)
                            .font(Fonts.dateSmall)
                    }
                    .foregroundColor(Colors.content)
                }
            }.padding(.horizontal, Dimensions.smallPadding)
        }
        .frame(
            width: Dimensions.listCardImagePixelWidth.pixelsToPoints(),
            height: Dimensions.listCardImagePixelHeight.pixelsToPoints()
        )
        .background(Colors.background)
        .clipShape(RoundedRectangle(cornerRadius: Dimensions.cornerRadiusSmall))
        .shadow(radius: Dimensions.shadowSmall)
        .padding(.vertical, Dimensions.tinyPadding)
    }
}

#Preview {
    LandscapeGridItem(ItemDetail.getDummy())
}
