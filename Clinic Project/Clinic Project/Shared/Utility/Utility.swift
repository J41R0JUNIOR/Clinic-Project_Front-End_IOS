//
//  File.swift
//  Clinic Project
//
//  Created by The Godfather Júnior on 11/12/24.
//

import Foundation

public class Utility{
    public init() {}
    
    static let shared = Utility()
    
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
    
    func messageReceived(data: Data) -> String{
        if let responseString = String(data: data, encoding: .utf8) {
            var transformedResponse = responseString
            
            transformedResponse.removeAll { char in
                char == "\"" || char == "\\"
            }
            
            return .init(transformedResponse)
        }
        return ""
    }
}
