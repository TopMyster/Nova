//
//  ContentView.swift
//  Nova
//
//  Created by Toope Oladunjoye on 5/16/26.
//

import SwiftUI

struct ContentView: View {
    @State var url: String = ""
    
    var body: some View {
        ZStack {
            if url.isEmpty {
                Label("Nova", systemImage: "magnifyingglass.circle")
                    .font(.largeTitle)
            } else {
                Webview(url: $url)
                    .ignoresSafeArea(edges: .bottom)
            }
            
            VStack {
                Spacer()
                TabBarView(url: $url)
            }
        }
    }
}

#Preview {
    ContentView()
}
