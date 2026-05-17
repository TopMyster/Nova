//
//  TabsView.swift
//  Nova
//
//  Created by Toope Oladunjoye on 5/16/26.
//

import SwiftUI

struct TabsView: View {
    @Binding var tabs: [BrowserTab]
    @Binding var selectedTabID: BrowserTab.ID?
    @Binding var url: String
    @Binding var showTabs: Bool

    var body: some View {
        if !tabs.isEmpty {
            VStack(spacing: 12) {
                ScrollView {
                    LazyVStack(spacing: 10) {
                        ForEach(tabs) { tab in
                            TabRow(
                                tab: tab,
                                isSelected: selectedTabID == tab.id,
                                selectTab: {
                                    selectedTabID = tab.id
                                    url = tab.url
                                    showTabs = false
                                },
                                closeTab: {
                                    close(tab)
                                }
                            )
                        }
                    }
                    .padding(15)
                }
            }
            .glassEffect(.regular, in: .rect(cornerRadius: 30))
            .frame(maxWidth: .infinity)
            .frame(height: 350)
        }
    }

    private func close(_ tab: BrowserTab) {
        tabs.removeAll { $0.id == tab.id }

        if selectedTabID == tab.id {
            selectedTabID = tabs.last?.id
            url = tabs.last?.url ?? ""
        }
    }
}

private struct TabRow: View {
    let tab: BrowserTab
    let isSelected: Bool
    let selectTab: () -> Void
    let closeTab: () -> Void

    private var title: String {
        tab.url.isEmpty ? "New Tab" : tab.url
    }

    var body: some View {
        HStack(spacing: 10) {
            Button(action: selectTab) {
                HStack(spacing: 10) {
                    Image(systemName: tab.url.isEmpty ? "plus.circle" : "globe")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(isSelected ? Color.white : Color.primary.opacity(0.75))
                        .frame(width: 22, height: 22)

                    Text(title)
                        .font(.system(size: 15, weight: isSelected ? .semibold : .regular))
                        .lineLimit(1)
                        .truncationMode(.middle)
                        .foregroundStyle(isSelected ? Color.white : Color.primary)

                    Spacer(minLength: 0)
                }
                .contentShape(.rect)
            }
            .buttonStyle(.plain)

            Button(action: closeTab) {
                Image(systemName: "xmark")
                    .font(.system(size: 12, weight: .bold))
                    .foregroundStyle(isSelected ? Color.white : Color.secondary)
                    .frame(width: 28, height: 28)
                    .contentShape(.rect)
            }
            .buttonStyle(.plain)
            .accessibilityLabel("Close tab")
        }
        .padding(.leading, 14)
        .padding(.trailing, 8)
        .padding(.vertical, 10)
        .background(rowBackground, in: .rect(cornerRadius: 14))
    }

    private var rowBackground: Color {
        isSelected ? Color.accentColor : Color.gray.opacity(0.18)
    }
}

#Preview {
    ContentView()
}
