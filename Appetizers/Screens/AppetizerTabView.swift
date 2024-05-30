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
    
    @EnvironmentObject var order: Order

    var body: some View {
        TabView {
            AppetizerListView()
                .tabItem { Label("Home", systemImage: "house") }
            AccountView()
                .tabItem { Label("Account", systemImage: "person") }
            OrderView()
                .tabItem { Label("Order", systemImage: "bag") }
                .badge(order.items.count)
        }
    }

    
}

#Preview {
    AppetizerTabView()
        .modelContainer(for: Item.self, inMemory: true)
}
