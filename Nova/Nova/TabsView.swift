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
                List {
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
                        .listRowInsets(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                        .transition(rowTransition)
                    }
                    .onDelete(perform: closeTabs)
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
                .background(Color.clear)
                .animation(.snappy(duration: 0.25), value: tabs)
            }
            .glassEffect(.regular, in: .rect(cornerRadius: 30))
            .frame(maxWidth: 350)
            .frame(height: 350)
            .transition(panelTransition)
        }
    }

    private var panelTransition: AnyTransition {
        .move(edge: .bottom).combined(with: .opacity)
    }

    private var rowTransition: AnyTransition {
        .asymmetric(
            insertion: .move(edge: .bottom).combined(with: .opacity),
            removal: .move(edge: .trailing).combined(with: .opacity)
        )
    }

    private func close(_ tab: BrowserTab) {
        withAnimation(.snappy(duration: 0.25)) {
            tabs.removeAll { $0.id == tab.id }

            if selectedTabID == tab.id {
                selectedTabID = tabs.last?.id
                url = tabs.last?.url ?? ""
            }
        }
    }

    private func closeTabs(at offsets: IndexSet) {
        let closingSelectedTab = selectedTabID.map { selectedID in
            offsets.contains { tabs[$0].id == selectedID }
        } ?? false

        withAnimation(.snappy(duration: 0.25)) {
            tabs.remove(atOffsets: offsets)

            if closingSelectedTab {
                selectedTabID = tabs.last?.id
                url = tabs.last?.url ?? ""
            }
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
        VStack() {
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
            }
            .padding(.leading, 14)
            .padding(.trailing, 8)
            .padding(.vertical, 10)
            .background(rowBackground, in: .rect(cornerRadius: 14))
        }.padding(.top, 10)
    }

    private var rowBackground: Color {
        isSelected ? Color.accentColor : Color.gray.opacity(0.18)
    }
}

#Preview {
    ContentView()
}
