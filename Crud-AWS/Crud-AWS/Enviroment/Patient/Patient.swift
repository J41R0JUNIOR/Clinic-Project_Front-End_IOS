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
//    var birthDate: String?
    var healthServiceNumber: String?
    var phoneNumber: String?
    var height: Int?
    var weight: Int?
    
//    var birthDateAsDate: Date? {
//          guard let birthDate = birthDate else { return nil }
//          return ISO8601DateFormatter().date(from: birthDate)
//      }
}
