//
//  Patient.swift
//  Crud-AWS
//
//  Created by Jairo Júnior on 26/10/24.
//

import Foundation


struct Patient: Codable, Identifiable {
    var id: String?
    var name: String? = ""
    var birthDate: String? = ""
    var healthServiceNumber: String? = ""
    var phoneNumber: String? = ""
    var height: Int? = 0
    var weight: Int? = 0
    var adress: Adress?
    
    var birthDateAsDate: Date {
        get {
            guard let birthDate = birthDate else { return Date() }
            let formatter = ISO8601DateFormatter()
            return formatter.date(from: birthDate) ?? Date()
        }
        set {
            let formatter = ISO8601DateFormatter()
            birthDate = formatter.string(from: newValue)
        }
    }
}

struct Adress: Codable{
    var street: String? = ""
    var city: String? = ""
    var state: String? = ""
    var country: String? = ""
    var postalCode: String? = ""
}
