//
//  TabsView.swift
//  Nova
//
//  Created by Toope Oladunjoye on 5/16/26.
//

import SwiftUI

struct TabsView: View {
    @Binding var tabs: [String]
    var body: some View {
        if !tabs.isEmpty {
            VStack(spacing: 15) {
                ScrollView {
                    ForEach(tabs, id: \.self) { tab in
                        Text(tab)
                            .frame(width: 270)
                            .padding(15)
                            .background(Color.gray.opacity(0.3), in: .rect(cornerRadius: 12))
                            .padding(.bottom, 10)
                    }
                }
            }
            .padding(25)
            .glassEffect(.regular, in: .rect(cornerRadius: 30))
            .frame(height: 350)
        }
    }
}

#Preview {
    ContentView()
}
