//
//  CallApi.swift
//  Crud-AWS
//
//  Created by Jairo Júnior on 25/10/24.
//



enum APIError: Error{
    case invalidURL
    case invalidResponse
    case invalidData
}

import Foundation

@Observable
class Api: ObservableObject {
    
    static var shared = Api()
    
    func getAllPatients<T: Decodable>() async  throws -> T? {
        
        guard let url = URL(string: URLs.getAllPatients.rawValue) else {
             throw APIError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIError.invalidResponse
        }
        
        return try decode(content: data)
        
    }
    
    func getPatientById<T: Decodable>(id: String) async throws -> T? {
        
        guard let url = URL(string: "\(URLs.getPatientById.rawValue)/\(id)") else {
            throw APIError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIError.invalidResponse
        }
        
        return try decode(content: data)
    }

    func createPatient(patient: Patient) async throws {
        
        guard let url = URL(string: URLs.createPatient.rawValue) else {
            throw APIError.invalidURL
        }
        
        let patientData = try JSONEncoder().encode(patient)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = patientData
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let (_, response) = try await URLSession.shared.data(for: request)
        
        if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode) {
            throw APIError.invalidResponse
        }
    }
    
    func updatePatient(id: String, patient: Patient) async throws {
        guard let url = URL(string: "\(URLs.updatePatient.rawValue)\(id)") else {
            throw APIError.invalidURL
        }
                
        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        request.httpBody = encode(content: patient)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let (_, response) = try await URLSession.shared.data(for: request)
        
        if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode) {
            throw APIError.invalidResponse
        }
    }
    
    func deletePatient(id: String) async throws {
        guard let url = URL(string: "\(URLs.getPatientById.rawValue)\(id)") else {
            throw APIError.invalidURL
        }
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
    
        let (_, response) = try await URLSession.shared.data(for: request)
        
        if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode) {
            throw APIError.invalidResponse
        }
    }
#warning("encode")
    func encode<T:Codable>(content: T) -> Data? {
      
        do {
            let data = try JSONEncoder().encode(content)
            return data
            
        } catch {
            return nil
        }
    }

    func decode<T: Decodable>(content: Data) throws -> T? {
        return try? JSONDecoder().decode(T.self, from: content)
    }
}

struct Patient: Codable, Identifiable {
    var id: String?
    var name: String?
    var age: Int?
    var healthServiceNumber: String?
    var phoneNumber: String?
    var height: Int?
    var weight: Int?
}
