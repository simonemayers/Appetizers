import SwiftUI

struct FormAlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct FormAlertContext {
    static let invalidFirstName = AlertItem(title: Text("Form Error"), message: Text("First name field cannot be empty. Please enter your first name."), dismissButton: .default(Text("Ok")))
    static let invalidLastName = AlertItem(title: Text("Form Error"), message: Text("Last name field cannot be empty. Please enter your last name."), dismissButton: .default(Text("Ok")))
    static let invalidEmail = AlertItem(title: Text("Form Error"), message: Text("Email address is invalid. Please enter your email address again."), dismissButton: .default(Text("Ok")))
}
