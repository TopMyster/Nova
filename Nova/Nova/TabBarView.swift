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
    @Binding var tabs: [String]
    var body: some View {
        HStack() {
            TextField("**Search anything...**", text: $newUrl).padding(.leading, 15).textFieldStyle(.plain)
            
            Button("New Tabs", systemImage: "plus") {
                tabs.append(url)
            }.foregroundStyle(Color.black).padding(.trailing, 6).labelStyle(.iconOnly).font(.custom("bigger", size: 22))
            
            Button("Tabs", systemImage: "square.on.square") {
                if showTabs {
                    showTabs = false
                } else {
                    showTabs = true
                }
            }.foregroundStyle(Color.black).padding(.trailing, 4).labelStyle(.iconOnly)
            
            Button("Search", systemImage: "magnifyingglass") {
                url = newUrl
            }.padding(5).foregroundStyle(Color.white).buttonStyle(.borderedProminent).labelStyle(.iconOnly)
        }.padding(5).glassEffect(.regular).frame(width: 350)
    }
}

#Preview {
    ContentView()
}
