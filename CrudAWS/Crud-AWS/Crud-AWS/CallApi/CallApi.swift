//
//  CallApi.swift
//  Crud-AWS
//
//  Created by Jairo Júnior on 25/10/24.
//

enum URLs: String {
    case getAllPatients = "https://6faeslzxx1.execute-api.us-east-1.amazonaws.com/dev/patients/allPatients"
}

enum APIError: Error{
    case invalidURL
    case invalidResponse
    case invalidData
}

import Foundation


class CallApi: ObservableObject {
    
    static var shared = CallApi()
    
    var patients: [Patient] = []
    
    func getAllPatients() async  throws -> [Patient] {
        
        guard let url = URL(string: URLs.getAllPatients.rawValue) else {
             throw APIError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIError.invalidResponse
        }
        
        do {
            let patients = try JSONDecoder().decode([Patient].self, from: data)
            self.patients = patients
            return patients
        } catch {
            throw APIError.invalidData
        }
    }
}

struct Patient: Codable, Identifiable {
    let id: String?
    let name: String?
    let age: Int?
    let healthServiceNumber: String?
    let phoneNumber: String?
    let height: Int?
    let weight: Int?
}
