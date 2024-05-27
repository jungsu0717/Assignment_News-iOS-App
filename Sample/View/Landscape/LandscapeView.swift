//
//  LandscapeView.swift
//  Sample
//
//  Created by Julian on 5/26/24.
//

import SwiftUI

struct LandscapeView: View {
    
    @ObservedObject var vm: ItemViewModel
    
    var body: some View {
        List(vm.groupedItems.indices, id: \.self) { index in
            
            ScrollView(.horizontal,showsIndicators: false) {
                HStack(spacing: Dimensions.largePadding) {
                    ForEach(vm.groupedItems[index]) { item in
                        ZStack {
                            NavigationLink(destination: DetailWebView(item)) {
                                    LandscapeGridItem(item)
                            }.buttonStyle(PlainButtonStyle())
                        }
                    }
                }
                .padding(.vertical, Dimensions.largePadding)
            }
            
        }
        .hideListRowSeparator()
            
        
        .listStyle(.plain)
        .navigationTitle(Strings.navigationTitle)
    }
}

#Preview {
    LandscapeView(vm: ItemViewModel())
}
