//
//  APIService.swift
//  DemoJokesAppLTIM
//
//  Created by 61092893 on 28/01/24.
//

import Foundation

enum APIServiceError: Error{
    case badUrl, badRequest, requestError, decodingError, statusNotOK
}

struct JokesAPIDataSourceImplementation: JokesDataSource {

    let BASE_URL: String = "https://api.api-ninjas.com/v1"

    func getJokes() async throws -> [Jokes] {
        
        guard let url = URL(string: "\(BASE_URL)/jokes?limit=50") else{
            throw APIServiceError.badUrl
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("fEWzHLyTYWD8oFYRbncghQ==sKgbuH4noNtqTQbF", forHTTPHeaderField: "X-Api-Key")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        guard let (data, response) = try? await URLSession.shared.data(for: request) else {
                   throw APIServiceError.requestError
               }

        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIServiceError.statusNotOK
        }
        
        guard let result = try? JSONDecoder().decode([JokesEntity].self, from: data) else {
            throw APIServiceError.decodingError
        }
        
        return result.map({ item in
            Jokes(
                joke: item.joke
            )
        })
    }
}
