//
//  DetailWebView.swift
//  Sample
//
//  Created by Julian on 5/25/24.
//

import SwiftUI

struct DetailWebView: View {
    
    var itemDetail: ItemDetail
    
    init(_ itemDetail : ItemDetail) {
        self.itemDetail = itemDetail
    }
    
    var body: some View {
        VStack {
            WebView(url: "\(itemDetail.url ?? "")")
            //                .edgesIgnoringSafeArea(.all)
        }
        .navigationBarTitle(itemDetail.title ?? Strings.navigationDetailTitle, displayMode: .inline)
        
    }
}

#Preview {
    DetailWebView(ItemDetail.getDummy())
}
