//
//  WebView.swift
//  Sample
//
//  Created by Julian on 5/25/24.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: String
        
    func makeUIView(context: Context) -> WKWebView  {
        
        guard let url = URL(string: url) else {
            return WKWebView()
        }
        let webView = WKWebView()

        webView.load(URLRequest(url: url))
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        guard let url = URL(string: url) else { return }
        webView.load(URLRequest(url: url))
    }
}

#Preview {
    WebView(url: "https://developer.apple.com/").edgesIgnoringSafeArea(.all)
}
