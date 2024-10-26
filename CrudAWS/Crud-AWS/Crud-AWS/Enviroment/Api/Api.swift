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
class CallApi: ObservableObject {
    
    static var shared = CallApi()
    
    
    
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
        
  
//            let patients = try JSONDecoder().decode([Patient].self, from: data)
//            self.patients = patients
//            return patients
        return try decode(content: data)
        
    }
    
    func getPatientById(id: String) async throws -> Patient {
        guard let url = URL(string: "\(URLs.getPatientById.rawValue)/\(id)") else {
            throw APIError.invalidURL
        }
        print("getbyid : \(url)")
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIError.invalidResponse
        }
        
        do {
            return try JSONDecoder().decode(Patient.self, from: data)
           
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
        guard let url = URL(string: "\(URLs.getPatientById.rawValue)\(id)") else {
            throw APIError.invalidURL
        }
        print("delete : \(url)")
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
    
        let (_, response) = try await URLSession.shared.data(for: request)
        
        if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode) {
            print("Erro")
        }
    }
    
//    func encode<T:Codable>(content: T) -> Data? {
//        let encoder = PropertyListEncoder()
//        encoder.outputFormat = .xml
//
//        do {
//            let data = try encoder.encode(content)
//            return data
//        } catch {
//            return nil
//        }
//    }

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
