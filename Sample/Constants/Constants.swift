//
//  Constant.swift
//  Sample
//
//  Created by Julian on 5/27/24.
//

import Foundation
import SwiftUI

struct Constants {
    
    struct Dimensions {
        // padding
        static let zeroPadding: CGFloat = 0.0
        static let tinyPadding: CGFloat = 1.0
        
        static let smallPadding: CGFloat = 4.0
        static let mediumPadding: CGFloat = 8.0
        static let largePadding: CGFloat = 12.0
        
        // width
        static let clockSmallWidth: CGFloat = 8
        static let listCardImageWidth: CGFloat = 100.0
        static let listCardImagePixelWidth: CGFloat = 300.0
        static let headerIconWidth: CGFloat = 20.0
        
        
        // height
        static let cardContentHeight: CGFloat = 100.0
        static let listCardImageHeight: CGFloat = 100.0
        static let listCardImagePixelHeight: CGFloat = 120.0
        static let headerIconHeight: CGFloat = 20.0
        
        // shadow
        static let shadowSmall: CGFloat = 2.0
        
        // cornerRadius
        static let cornerRadiusSmall: CGFloat = 4.0
        static let cornerRadiusLarge: CGFloat = 20.0
    }
    
    struct Fonts {
        static let titleLarge = Font.system(size: 16, weight: .bold)
        static let contentsLarge = Font.system(size: 12, weight: .regular)
        static let dateLarge = Font.system(size: 12, weight: .regular)
        
        static let titleMedium = Font.system(size: 14, weight: .bold)
        static let contentsMedium = Font.system(size: 12, weight: .regular)
        static let dateMedium = Font.system(size: 12, weight: .regular)
        
        static let titleSmall = Font.system(size: 12, weight: .bold)
        static let contentsSmall = Font.system(size: 10, weight: .regular)
        static let dateSmall = Font.system(size: 8, weight: .regular)
        
        static let splashIcon = Font.system(size: 100, weight: .regular)
        static let emptyImage = Font.system(size: 20)
        static let emptyText = Font.system(size: 12, weight: .bold)
        
    }
    
    struct Colors {
        static let title = Color("NewsTitle")
        static let content = Color("NewsContent")
        static let background = Color("NewsBg")
        
        static let splashBg = Color("SplashBg")
        static let splashIcon = Color("SplashIcon")
        
        static let emptyImage = Color("EmptyImage")
        
    }
    
    struct SFSymbols {
        static let calendar = "calendar"
        static let clockFill = "clock.badge.fill"
        static let splashIcon = "rectangle.3.group.bubble.fill"
        static let emptyImage = "rectangle.portrait.on.rectangle.portrait.slash.fill"
        static let galleryIcon = "text.below.photo"
        static let ListIcon = "list.bullet"
    }
    
    struct Strings {
        static let navigationTitle = "News"
        static let navigationDetailTitle = "News Detail"
        static let emptyImage = "Empty"
    }
    
    struct Dummys {
        static let itemDetailDummy = ItemDetail(
            source: Source.getDummy(),
            author: "홍길동",
            title: "스팀 통계로 살펴보는, 현세대 PC 평균 스펙 - 게임메카",
            description: "PC 게이머들이 애용하는 스팀은 방대한 유저...",
            url: "https://www.gamemeca.com/view.php?gid=1749199",
            urlToImage: "https://cdn.gamemeca.com/gmdata/0001/749/199/gm234699_pc_sn.jpg",
            publishedAt: "2024-05-23T08:37:07Z",
            content: "내용"
        )
        
        static let itemModelDummy = ItemModel(status: "ok", totalCnt: 34, items: [ItemDetail.getDummy()])
        
        static let dummyImgUrl = "https://cdn.gamemeca.com/gmdata/0001/749/199/gm234699_pc_sn.jpg"
    }
}
