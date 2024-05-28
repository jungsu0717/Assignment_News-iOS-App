//
//  DetailWebView.swift
//  Sample
//
//  Created by Julian on 5/25/24.
//

import SwiftUI

struct DetailWebView: View {
    
    var vm : ItemViewModel
    var itemDetail: ItemDetail
    
    init(vm: ItemViewModel, _ itemDetail : ItemDetail) {
        self.vm = vm
        self.itemDetail = itemDetail
    }
    
    var body: some View {
        VStack {
            WebView(url: "\(itemDetail.url ?? "")")
            //                .edgesIgnoringSafeArea(.all)
                .onAppear{
                    
                    self.vm.markItemAsChecked(self.itemDetail)
                }
        }
        .navigationBarTitle(itemDetail.title ?? Strings.navigationDetailTitle, displayMode: .inline)
        
    }
}

#Preview {
    DetailWebView(vm: ItemViewModel(), ItemDetail.getDummy())
}
