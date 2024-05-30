//
//  OrderView.swift
//  Appetizers
//
//  Created by Owner on 5/22/24.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order

    var body: some View {
        NavigationView {
            ZStack {
                if order.items.isEmpty {
                    ZStack{
                        EmptyState(imageName: "exclamationmark.bubble.fill", message: "You have items your order. \nPlease add an appetizer.")
                    }
                } else {
                    VStack{
                        List {
                            ForEach(order.items) { appetizer in
                                AppetizerListCell(appetizer: appetizer)
                            }
                            .onDelete(perform: order.deleteItems)
                        }
                        .listStyle(PlainListStyle())
                                            
                        Button {
                            print("order placed")
                            print(order.totalPrice)
                        } label: {
                           Text("$ \(order.totalPrice, specifier: "%.2f") - Place Order")
                        }
                        .modifier(StandardButtonStyle())
                        .padding(.bottom, 25)
                    }
                }
            }
            .navigationTitle("🧾 Orders")
        }
    }
    
    
    
}
#Preview {
    OrderView()
}
