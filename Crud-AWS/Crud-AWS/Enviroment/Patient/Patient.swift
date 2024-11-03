//
//  Patient.swift
//  Crud-AWS
//
//  Created by Jairo Júnior on 26/10/24.
//

import Foundation

struct Patient: Codable, Identifiable {
    var id: String?
    var name: String?
    var birthDate: String? // Armazenado como String
    var healthServiceNumber: String?
    var phoneNumber: String?
    var height: Int?
    var weight: Int?
    
    // Computed property para converter `birthDate` em `Date`
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

