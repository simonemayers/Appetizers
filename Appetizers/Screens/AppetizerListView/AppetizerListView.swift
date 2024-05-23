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
    
    @State private var isShowingDetail = false
    
    @State private var selectedAppetizer: Appetizer?
    
    var body: some View {
        ZStack{
            NavigationView {
                List(viewModel.appetizers){
                    appetizer in
                        AppetizerListCell(appetizer: appetizer)
                        .onTapGesture {
                            isShowingDetail = true
                            selectedAppetizer = appetizer
                        }
                }
                .navigationTitle("🍟 Appetizers")
                .disabled(isShowingDetail)
            }
            .onAppear{
                viewModel.getAppetizers()
            }
            .blur(radius: isShowingDetail ? 20 : 0)
            
            if isShowingDetail {
                AppetizerDetailView(appetizer: selectedAppetizer ?? MockData.sampleAppetizer, isShowingDetail: $isShowingDetail)
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
