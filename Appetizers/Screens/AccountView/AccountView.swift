//
//  AccountView.swift
//  Appetizers
//
//  Created by Owner on 5/22/24.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var vm = AccountViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Info")){
                    TextField("First Name", text: $vm.user.firstName)
                    TextField("Last Name", text: $vm.user.lastName)
                    TextField("Email", text: $vm.user.email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    
                    DatePicker("Birthday", selection: $vm.user.birthdate, displayedComponents: .date)
                    Button {
                        vm.saveChanges()
                    } label: {
                        Text("Save Changes")
                    }
                }
                .autocorrectionDisabled()
                
                Section(header: Text("Requests")){
                    Toggle("Napkins", isOn: $vm.user.isNapkins)
                    Toggle("Utensils", isOn: $vm.user.isUtensils)
                }
                .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
            }
            .navigationTitle("😂 Account")
        }
        .onAppear{
            vm.retrieveUser()
        }
        .alert(item: $vm.alertItem) {
            alertItem in
            Alert(title: alertItem.message,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton
            )
        }
    }
}

#Preview {
    AccountView()
}
