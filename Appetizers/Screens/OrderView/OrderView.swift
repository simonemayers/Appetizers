//
//  OrderView.swift
//  Appetizers
//
//  Created by Owner on 5/22/24.
//

import SwiftUI

struct OrderView: View {
    @State private var orderItems = MockData.orderItems

    var body: some View {
        NavigationView {
            ZStack {
                if orderItems.isEmpty {
                    ZStack{
                        EmptyState(imageName: "exclamationmark.bubble.fill", message: "You have items your order. \nPlease add an appetizer.")
                    }
                } else {
                    VStack{
                        List {
                            ForEach(orderItems) { appetizer in
                                AppetizerListCell(appetizer: appetizer)
                            }
                            .onDelete(perform: deleteItems)
                        }
                        .listStyle(PlainListStyle())
                                            
                        Button {
                            print("order placed")
                        } label: {
                            APButton(title: "$ \(orderItems[0].price, specifier: "%.2f") - Place Order")
                        }
                        .padding(.bottom, 25)
                    }
                }
            }
            .navigationTitle("🧾 Orders")
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        orderItems.remove(atOffsets: offsets)
        print(orderItems.isEmpty)
    }
    
}
#Preview {
    OrderView()
}
