//
//  ContentView.swift
//  Nova
//
//  Created by Toope Oladunjoye on 5/16/26.
//

import SwiftUI

struct ContentView: View {
    @State var url: String = ""
    @State var showTabs: Bool = false
    @State var tabs: [String] = []
    
    var body: some View {
        ZStack {
            if url.isEmpty {
                Label("Nova", systemImage: "magnifyingglass.circle")
                    .font(.largeTitle)
            } else {
                Webview(url: $url, tabs: $tabs)
                    .ignoresSafeArea(edges: .bottom)
            }
            
            VStack {
                Spacer()
                if showTabs {
                    TabsView(tabs: $tabs)
                }
                TabBarView(showTabs: $showTabs, url: $url, tabs: $tabs)
            }
        }
    }
}

#Preview {
    ContentView()
}
