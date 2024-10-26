//
//  Patient.swift
//  Crud-AWS
//
//  Created by Jairo Júnior on 26/10/24.
//

import Foundation

//
//struct Patient: Codable, Identifiable {
////    var pk: String // Chave primária (PK)
//    var id: String?
//    var taxId: String?
//    var healthServiceNumber: String?
//    var birthDate: Date?
//    var name: String?
//    var weight: Int? // Use Double para representar números decimais
//    var height: Int? // Use Double para representar números decimais
//    // Estrutura de endereço opcional
//    // var address: Address?
//    var phoneNumber: String?
//
////    // Estrutura opcional para endereço
////    struct Address: Codable {
////        var street: String?
////        var number: Int?
////        var city: String?
////        var state: String?
////        var country: String?
////    }
//}

struct Patient: Codable, Identifiable {
    var id: String?
    var name: String?
//    var birthDate: Date?
    var healthServiceNumber: String?
    var phoneNumber: String?
    var height: Int?
    var weight: Int?
}
