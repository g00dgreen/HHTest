//
//  APIService.swift
//  HHTest
//
//  Created by Артем Макар on 1.06.24.
//

import Foundation

class APIService {
    func getAllVacancies() async throws -> JobVacancy {
        let endpoint = Constants.baseURL
        
        guard let url = URL(string: endpoint) else {
            throw APIError.invalidURl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(JobVacancy.self, from: data)
        } catch {
            throw APIError.invalidData
        }
    }
}

enum APIError: Error {
    case invalidURl
    case invalidResponse
    case invalidData
}
