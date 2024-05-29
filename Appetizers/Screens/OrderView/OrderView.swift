//
//  OrderView.swift
//  Appetizers
//
//  Created by Owner on 5/22/24.
//

import SwiftUI

struct OrderView: View {
    @StateObject var vm = OrderViewModel()

    var body: some View {
        NavigationView {
            VStack{
                List {
                    ForEach(MockData.orderItems) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                    }
                }
                .listStyle(PlainListStyle())
                
                Spacer()
                
                Button {
                    print("order placed")
                } label: {
                    APButton(title: "$ \(MockData.orderItems[0].price, specifier: "%.2f") - Place Order")
                }
                .padding(.bottom, 25)
            }
            .navigationTitle("🧾 Orders")
        }
    }
    
}
#Preview {
    OrderView()
}
