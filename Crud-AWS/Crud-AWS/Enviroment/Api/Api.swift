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
    
    func getAllData<T: Decodable>(urlString: String) async  throws -> T? {
        
        guard let url = URL(string: urlString) else {
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
    
    func getDataById<T: Decodable>(urlString: String) async throws -> T? {
        
        guard let url = URL(string: urlString) else {
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

    func createData<T: Codable>(dataToCreate: T, urlString: String) async throws {
        
        guard let url = URL(string: urlString) else {
            throw APIError.invalidURL
        }
        
        let patientData = encode(content: dataToCreate)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = patientData
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let (_, response) = try await URLSession.shared.data(for: request)
        
        if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode) {
            throw APIError.invalidResponse
        }
    }
    
    func updateData<T: Codable>(dataToBeUpdated: T, urlString: String) async throws {
        guard let url = URL(string: urlString) else {
            throw APIError.invalidURL
        }
                
        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        request.httpBody = encode(content: dataToBeUpdated)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let (_, response) = try await URLSession.shared.data(for: request)
        
        if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode) {
            throw APIError.invalidResponse
        }
    }
    
    func deleteData(urlString: String) async throws {
        guard let url = URL(string: urlString) else {
            throw APIError.invalidURL
        }
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
    
        let (_, response) = try await URLSession.shared.data(for: request)
        
        if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode) {
            throw APIError.invalidResponse
        }
    }
    
    func encode<T:Codable>(content: T) -> Data? {
      
        do {
            let data = try JSONEncoder().encode(content)
            return data
            
        } catch {
            return nil
        }
    }

    func decode<T: Decodable>(content: Data) throws -> T? {
        let decoder = JSONDecoder()
        return try? decoder.decode(T.self, from: content)
    }
}


