//
//  Model.swift
//  Clinic Project
//
//  Created by The Godfather Júnior on 11/12/24.
//

import Foundation
import SwiftData

public enum Model {
    public struct User: Codable {
        var clientId: String?
        var username: String
        var password: String?
        var email: String?
        var code: String?
        var token: String?
    }
    
    public struct SignInReturn: Codable, Sendable {
        var accessToken: String
        var idToken: String
        var refreshToken: String
    }
    
    public struct Patient: Codable {
        var id: String?
        var name: String?
        var birthDate: String?
        var healthServiceNumber: String?
        var phoneNumber: String?
        var height: Int?
        var weight: Int?
        
        struct adress {
            var street: String?
            var city: String?
            var state: String?
            var country: String?
            var postalCode: String?
        }
        
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
    
    @Model
    public class LoginUserSwiftData {
        var username: String
        var password: String
        var accessToken: String
        var idToken: String
        var refreshToken: String
        
        init(username: String, password: String, accessToken: String, idToken: String, refreshToken: String) {
            self.username = username
            self.password = password
            self.accessToken = accessToken
            self.idToken = idToken
            self.refreshToken = refreshToken
        }
    }
}



