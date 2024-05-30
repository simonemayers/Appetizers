//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Owner on 5/23/24.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    
    @AppStorage("user") private var userData: Data?
    @Published var user = User()
    @Published var alertItem: AlertItem?
    
    func saveChanges() {
        guard isValidForm else { return }
        
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = FormAlertContext.userSaveSuccess
        } catch {
            alertItem = FormAlertContext.invalidUserData
        }
    }
    
    func retrieveUser(){
        guard let userData else { return }
        
        do {
            user = try JSONDecoder().decode(User.self, from: userData)
        } catch {
            alertItem = FormAlertContext.invalidUserData
        }
    }
    
    var isValidForm: Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
        
            switch user.firstName.isEmpty {
            case true:
                alertItem = FormAlertContext.invalidFirstName
            case false:
                break
            }
            
            switch user.lastName.isEmpty {
            case true:
                alertItem = FormAlertContext.invalidLastName
            case false:
                break
            }
            
            switch user.email.isEmpty {
            case true:
                alertItem = FormAlertContext.invalidEmail
            case false:
                break
            }
            
            return false
        }
        
        guard user.email.isValidEmail else {
            alertItem = FormAlertContext.invalidEmail
            return false
        }
        
        return true
    }
    
    
    
}
