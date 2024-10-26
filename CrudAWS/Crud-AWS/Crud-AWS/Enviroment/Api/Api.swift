//
//  CallApi.swift
//  Crud-AWS
//
//  Created by Jairo Júnior on 25/10/24.
//

enum URLs: String {
    case getAllPatients = "https://6faeslzxx1.execute-api.us-east-1.amazonaws.com/dev/patients/allPatients"
    case deletePatient = "https://6faeslzxx1.execute-api.us-east-1.amazonaws.com/dev/patient/"
    case createPatient = "https://6faeslzxx1.execute-api.us-east-1.amazonaws.com/dev/patients"
    case updatePatient = "https://6faeslzxx1.execute-api.us-east-1.amazonaws.com/dev/patients/"
}

enum APIError: Error{
    case invalidURL
    case invalidResponse
    case invalidData
}

import Foundation

@Observable
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
        
        let patientData = try JSONEncoder().encode(patient)
        
        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        request.httpBody = patientData
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let (_, response) = try await URLSession.shared.data(for: request)
        
        if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode) {
            throw APIError.invalidResponse
        }
    }
    
    func deletePatient(id: String) async throws {
        guard let url = URL(string: "\(URLs.deletePatient.rawValue)\(id)") else {
            throw APIError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
    
        let (_, response) = try await URLSession.shared.data(for: request)
        
        if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode) {
            print("Erro")
        }
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
