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
    static let userSaveSuccess = AlertItem(title: Text("Profile Saved"), message: Text("Your profile information was successfully saved."), dismissButton: .default(Text("Ok")))
    static let invalidUserData = AlertItem(title: Text("Profile Error"), message: Text("There was a problem saving or retrieving your profile."), dismissButton: .default(Text("Ok")))
}
