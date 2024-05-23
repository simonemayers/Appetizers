//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Owner on 5/22/24.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var viewModel = AppetizerListViewModel()
    
    @State private var appetizers: [Appetizer] = []
    
    var body: some View {
        ZStack{
            NavigationView {
                List(viewModel.appetizers){
                    appetizer in
                        AppetizerListCell(appetizer: appetizer)
                }
                .navigationTitle("🍟 Appetizers")
            }
            .onAppear{
                viewModel.getAppetizers()
            }
            if viewModel.isLoading {
                LoadingView()
            }

        }
        .alert(item: $viewModel.alertItem) {
            alertItem in
            Alert(
                title: alertItem.title,
                message: alertItem.message,
                dismissButton: alertItem.dismissButton)
        }
    }
}


#Preview {
    AppetizerListView()
}
