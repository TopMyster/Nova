//
//  TabBarView.swift
//  Nova
//
//  Created by Toope Oladunjoye on 5/16/26.
//

import SwiftUI

struct TabBarView: View {
    @State var newUrl = ""
    @Binding var url: String
    var body: some View {
        HStack() {
            TextField("**Enter URL**", text: $newUrl).padding(.leading, 15).textFieldStyle(.plain)
            Button("Search", systemImage: "magnifyingglass") {
                url = newUrl
            }.padding(5).foregroundStyle(Color.white).buttonStyle(.borderedProminent)
        }.padding(5).glassEffect(.regular).frame(width: 350)
    }
}

#Preview {
    ContentView()
}
