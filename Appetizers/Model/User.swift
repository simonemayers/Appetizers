//
//  User.swift
//  Appetizers
//
//  Created by Owner on 5/29/24.
//

import Foundation

struct User: Codable {
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthdate = Date()
    var isNapkins = false
    var isUtensils = false
}
