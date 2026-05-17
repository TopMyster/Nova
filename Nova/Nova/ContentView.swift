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
    @State var tabs: [BrowserTab] = []
    @State var selectedTabID: BrowserTab.ID?
    
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
                if showTabs {
                    TabsView(tabs: $tabs, selectedTabID: $selectedTabID, url: $url, showTabs: $showTabs)
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                }
                TabBarView(showTabs: $showTabs, url: $url, tabs: $tabs, selectedTabID: $selectedTabID)
            }
            .animation(.snappy(duration: 0.25), value: showTabs)
        }
    }
}

#Preview {
    ContentView()
}
