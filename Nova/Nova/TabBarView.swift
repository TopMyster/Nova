//
//  TabBarView.swift
//  Nova
//
//  Created by Toope Oladunjoye on 5/16/26.
//

import SwiftUI

struct TabBarView: View {
    @State var newUrl = ""
    @Binding var showTabs: Bool
    @Binding var url: String
    @Binding var tabs: [BrowserTab]
    @Binding var selectedTabID: BrowserTab.ID?
    var body: some View {
        HStack() {
            TextField("**Search anything...**", text: $newUrl).padding(.leading, 15).textFieldStyle(.plain)
            
            Button("New Tabs", systemImage: "plus") {
                withAnimation(.snappy(duration: 0.25)) {
                    let newTab = BrowserTab(url: "")
                    tabs.append(newTab)
                    selectedTabID = newTab.id
                    url = ""
                    newUrl = ""
                    showTabs = false
                }
            }.foregroundStyle(Color.black).padding(.trailing, 6).labelStyle(.iconOnly).font(.custom("bigger", size: 22))
            
            Button("Tabs", systemImage: "square.on.square") {
                withAnimation(.snappy(duration: 0.25)) {
                    showTabs.toggle()
                }
            }.foregroundStyle(Color.black).padding(.trailing, 4).labelStyle(.iconOnly)
            
            Button("Search", systemImage: "magnifyingglass") {
                url = newUrl
                if let selectedTabID, let index = tabs.firstIndex(where: { $0.id == selectedTabID }) {
                    tabs[index].url = newUrl
                } else {
                    let newTab = BrowserTab(url: newUrl)
                    tabs.append(newTab)
                    selectedTabID = newTab.id
                }
            }.padding(5).foregroundStyle(Color.white).buttonStyle(.borderedProminent).labelStyle(.iconOnly)
        }.padding(5).glassEffect(.regular).frame(width: 350)
    }
}

#Preview {
    ContentView()
}
