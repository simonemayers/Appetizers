//
//  ContentView.swift
//  Appetizers
//
//  Created by Owner on 5/22/24.
//

import SwiftUI
import SwiftData

struct AppetizerTabView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
        TabView {
            AppetizerListView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            AccountView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
            OrderView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Order")
                }
        }
        .accentColor(Color("brandPrimary"))
    }

    
}

#Preview {
    AppetizerTabView()
        .modelContainer(for: Item.self, inMemory: true)
}
