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
        
        let realmManager = RealmManager.instance
        let savedData = realmManager.read(NewsLocalData.self)
        
        let localData = savedData.first { data in data.title == itemDetail.title }
        
        self.itemDetail.isChecked = true
        if let data = localData {
            realmManager.update(data) { item in
                item.isChecked = true
            }
        }
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
