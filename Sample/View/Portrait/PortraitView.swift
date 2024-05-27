//
//  PortraitView.swift
//  Sample
//
//  Created by Julian on 5/26/24.
//

import SwiftUI

struct PortraitView: View {
    
    @ObservedObject var vm: ItemViewModel
    
    var body: some View {
        List {
            // 세로모드일 경우
            ListHeaderView(vm: vm)
            
            ForEach(vm.items) { item in
                ZStack {
                    switch vm.toggleState {
                        case .gallery:
                            PortraitGalleryItem(item)
                        
                        case .list:
                            PortraitListItem(item)
                    }
                    NavigationLink(destination: DetailWebView(item)) {
                    }.opacity(0)
                }
            }
            .hideListRowSeparator()
            
        }
        .listStyle(.plain)
        .navigationTitle(Strings.navigationTitle)
    }
}

#Preview {
    PortraitView(vm: ItemViewModel())
}
