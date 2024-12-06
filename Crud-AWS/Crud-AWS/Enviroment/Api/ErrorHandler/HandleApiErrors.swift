//
//  HandleApiErrors.swift
//  Crud-AWS
//
//  Created by Jairo Júnior on 09/11/24.
//

import Foundation

extension Api {
    func handleError(data: Data) -> String{
        if let responseString = String(data: data, encoding: .utf8) {
            var transformedResponse = responseString
            
            transformedResponse.removeAll { char in
                char == "\"" || char == "\\"
            }
       
            return .init(transformedResponse)
        }
        return ""
    }
    
    func clearError(){
        self.error = .init()
    }
}
