//
//  LandscapeItem.swift
//  Sample
//
//  Created by Julian on 5/24/24.
//
import SwiftUI

struct LandscapeItem: View {
    
    let title: String
    let footnote: String
    let score: Int
    let commentCount: Int
    let urlPath: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(title)
                .font(.headline)
            Text(footnote)
                .font(.footnote)
                .foregroundColor(.secondary)
            ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
                Label(score.formatted(), systemImage: "arrowtriangle.up.circle")
                    .foregroundStyle(.blue)
                Label(commentCount.formatted(), systemImage: "ellipses.bubble")
                    .foregroundStyle(.orange)
                    .padding(.leading, 96.0)
            }
            .font(.footnote)
            .labelStyle(.titleAndIcon)
        }
        .frame(maxWidth: .infinity, maxHeight: 300)
        .clipShape(RoundedRectangle(cornerRadius: 50))
        .background(Color.white)
        .shadow(radius: 7)
        .padding(20)
    }
}

#Preview {
    LandscapeItem(
        title: "제목",
        footnote: "부제목",
        score: 1535,
        commentCount: 773,
        urlPath: "https://i.ytimg.com/vi/qZTlfmGMwpI/maxresdefault.jpg"
    )
}

