//
//  CallApi.swift
//  Crud-AWS
//
//  Created by Jairo Júnior on 25/10/24.
//


import Foundation

@Observable
class Api: ObservableObject {
    
    static var shared = Api()
    
    var error: String = .init()
    
    func getAllData<T: Decodable>(urlString: String) async  throws -> T? {
        
        guard let url = URL(string: urlString) else {
             throw APIError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = MethodApi.get.rawValue
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            handleError(data: data)
            throw APIError.invalidResponse
        }
        
        return try decode(content: data)
        
    }
    
    func getDataById<T: Decodable>(urlString: String) async throws -> T? {
        
        guard let url = URL(string: urlString) else {
            throw APIError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = MethodApi.get.rawValue
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            handleError(data: data)
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
        request.httpMethod = MethodApi.post.rawValue
        request.httpBody = patientData
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let (data, response) = try await URLSession.shared.data(for: request)
        
        if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode) {
            handleError(data: data)
            throw APIError.invalidResponse
        }
    }
    
    func updateData<T: Codable>(dataToBeUpdated: T, urlString: String) async throws {
        guard let url = URL(string: urlString) else {
            throw APIError.invalidURL
        }
                
        var request = URLRequest(url: url)
        request.httpMethod = MethodApi.patch.rawValue
        request.httpBody = encode(content: dataToBeUpdated)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode) {
            handleError(data: data)
            throw APIError.invalidResponse
        }
    }
    
    func deleteData(urlString: String) async throws {
        guard let url = URL(string: urlString) else {
            throw APIError.invalidURL
        }
        var request = URLRequest(url: url)
        request.httpMethod = MethodApi.delete.rawValue
    
        let (data, response) = try await URLSession.shared.data(for: request)
        
        if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode) {
            handleError(data: data)
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

