//
//  ImageView.swift
//  Sample
//
//  Created by Julian on 5/25/24.
//

import SwiftUI

struct ImageView: View {
    
    @ObservedObject var imageLoader: ImageLoader
    
    init(_imageUrl: String?) {
        imageLoader = ImageLoader(_imageUrl: _imageUrl)
    }
    
    var body: some View {
        HStack(alignment: .center) {
            
            switch imageLoader.loadingStatus {
                case .loading:
                    ZStack(alignment: .center) {
                        Colors.background.edgesIgnoringSafeArea(.all)
                        ProgressView().tint(Colors.splashBg)
                    }
                case .completion:
                    if let image = imageLoader.image {
                        Image(uiImage: image)
                            .resizable()
                            .frame(alignment: .center)
                    }
                    else {
                        EmptyImage()
                    }
                case .failure:
                    EmptyImage()
            }
        }
    }
}

#Preview {
//    ImageView(_imageUrl: Dummys.dummyImgUrl)
    ImageView(_imageUrl: "")
}
