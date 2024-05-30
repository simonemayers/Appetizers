//
//  Alert.swift
//  Appetizers
//
//  Created by Owner on 5/22/24.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidData = AlertItem(title: Text("Server Error"), message: Text("The data received from the ser was invalid. Please contact support."), dismissButton: .default(Text("Ok")))
    static let invalidResponse = AlertItem(title: Text("Server Error"), message: Text("Invalid response from the server. Please try again later or contact support"), dismissButton: .default(Text("Ok")))
    static let invalidURL = AlertItem(title: Text("Server Error"), message: Text("There was an issue connecting to the server. If this persists, please contact support."), dismissButton: .default(Text("Ok")))
    static let unableToComplete = AlertItem(title: Text("Server Error"), message: Text("Unable to complete your request at this time. Pleasae check your internet connection."), dismissButton: .default(Text("Ok")))
    static let genericError = AlertItem(title: Text("Something went wrong."), message: Text("We were unable to complete your request at this time, please try again later."), dismissButton: .default(Text("Ok")))
    
}
