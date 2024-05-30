//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Owner on 5/22/24.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var vm = AppetizerListViewModel()
    
    var body: some View {
        ZStack{
            NavigationView {
                List(vm.appetizers){
                    appetizer in
                        AppetizerListCell(appetizer: appetizer)
                        .listRowSeparator(.hidden)
//                        .listRowSeparatorTint(.brandPrimary)
                        .onTapGesture {
                            vm.isShowingDetail = true
                            vm.selectedAppetizer = appetizer
                        }
                }
                .navigationTitle("🍟 Appetizers")
                .listStyle(.plain)
                .disabled(vm.isShowingDetail)
            }
            .onAppear{
                vm.getAppetizers()
            }
            .blur(radius: vm.isShowingDetail ? 20 : 0)
            
            if vm.isShowingDetail {
                AppetizerDetailView(appetizer: vm.selectedAppetizer ?? MockData.sampleAppetizer, isShowingDetail: $vm.isShowingDetail)
            }
            if vm.isLoading {
                LoadingView()
            }

        }
        .alert(item: $vm.alertItem) {
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
