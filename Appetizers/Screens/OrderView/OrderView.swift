//
//  OrderView.swift
//  Appetizers
//
//  Created by Owner on 5/22/24.
//

import SwiftUI

struct OrderView: View {
    @StateObject var vm = OrderViewModel()
    
    @State private var orderItems = MockData.orderItems

    var body: some View {
        NavigationView {
            VStack{
                List {
                    ForEach(orderItems) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                    }
                    .onDelete(perform: deleteItems)
                }
                .listStyle(PlainListStyle())
                
                Spacer()
                
                Button {
                    print("order placed")
                } label: {
                    APButton(title: "$ \(orderItems[0].price, specifier: "%.2f") - Place Order")
                }
                .padding(.bottom, 25)
            }
            .navigationTitle("🧾 Orders")
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        orderItems.remove(atOffsets: offsets)
    }
    
}
#Preview {
    OrderView()
}
