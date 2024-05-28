//
//  PortraitGalleryItem.swift
//  Sample
//
//  Created by Julian on 5/24/24.
//

import Foundation
import SwiftUI

struct PortraitGalleryItem: View {
    
    var itemDetail: ItemDetail
    
    init(_ itemDetail : ItemDetail) {
        self.itemDetail = itemDetail
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: Dimensions.mediumPadding) {
            ImageView(_imageUrl: itemDetail.urlToImage).frame(alignment: .center)
            
            VStack(alignment: .leading, spacing: Dimensions.smallPadding) {
                Spacer()
                
                Divider()
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
                    Label(itemDetail.getPublishedAt, systemImage: SFSymbols.calendar)
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
            .padding([.horizontal, .bottom], Dimensions.largePadding)
            .frame(maxHeight: Dimensions.cardContentHeight)
        }
        .frame(height: UIScreen.main.bounds.width * 0.8)
        .background(Colors.background)
        .clipShape(RoundedRectangle(cornerRadius: Dimensions.cornerRadiusLarge))
        .shadow(radius: Dimensions.shadowSmall)
    }
}

#Preview {
    PortraitGalleryItem(ItemDetail.getDummy())
}
