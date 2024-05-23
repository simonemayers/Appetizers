//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Owner on 5/23/24.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var birthdate = Date()
    @Published var isNapkins = false
    @Published var isUtensils = false
    @Published var alertItem: AlertItem?
    
    var isValidForm: Bool {
        guard !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty else {
        
            switch firstName.isEmpty {
            case true:
                alertItem = FormAlertContext.invalidFirstName
            case false:
                break
            }
            
            switch lastName.isEmpty {
            case true:
                alertItem = FormAlertContext.invalidLastName
            case false:
                break
            }
            
            switch email.isEmpty {
            case true:
                alertItem = FormAlertContext.invalidEmail
            case false:
                break
            }
            
            return false
        }
        
        guard email.isValidEmail else {
            alertItem = FormAlertContext.invalidEmail
            return false
        }
        
        return true
    }
    
    func saveChanges() {
        guard isValidForm else { return }
        print("Changes have been saved successfully")
    }
    
}
