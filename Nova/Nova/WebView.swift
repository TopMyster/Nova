//
//  WebView.swift
//  Nova
//
//  Created by Toope Oladunjoye on 5/16/26.
//

import SwiftUI
import WebKit

struct Webview: UIViewRepresentable {
    @Binding var url: String
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        let formattedUrl = url.contains("https://") ? url : url.contains(".") && !url.contains("https://") ? "https://\(url)" : !url.contains("https://") && !url.contains(".") ? "https://www.google.com/search?q=\(url)" : url
        let url = URL(string: formattedUrl)
        if let url = url {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
}

#Preview {
    ContentView()
}
