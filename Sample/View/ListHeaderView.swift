//
//  ListHeaderView.swift
//  Sample
//
//  Created by Julian on 5/25/24.
//

import SwiftUI

struct ListHeaderView: View {
    
    @ObservedObject var vm: ItemViewModel
    
    var body: some View {
        HStack {
            Spacer()
            Button {
                vm.setToggleState(_state: 0)
              } label: {
                  Image(systemName: SFSymbols.galleryIcon)
                  .imageScale(.medium)
                  .foregroundColor(
                    vm.toggleState == .gallery ?
                        Colors.splashIcon : Colors.emptyImage
                  )
                  .frame(
                    width: Dimensions.headerIconWidth,
                    height: Dimensions.headerIconHeight
                  )
                  
              }
              .buttonStyle(.bordered)
            Button {
                vm.setToggleState(_state: 1)
              } label: {
                Image(systemName: SFSymbols.ListIcon)
                  .imageScale(.large)
                  .foregroundColor(
                    vm.toggleState == .list ?
                        Colors.splashIcon : Colors.emptyImage
                  )
                  .frame(
                    width: Dimensions.headerIconWidth,
                    height: Dimensions.headerIconHeight
                  )
              }.buttonStyle(.bordered)
        }.hideListRowSeparator()
    }
}

#Preview {
    ListHeaderView(vm: ItemViewModel())
}
