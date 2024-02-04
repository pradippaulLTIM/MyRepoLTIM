//
//  GetJokesUseCase.swift
//  DemoJokesAppLTIM
//
//  Created by 61092893 on 28/01/24.
//

import Foundation

enum UseCaseError: Error{
    case networkError, decodingError
    
    var description: String {
        switch self {
        case .networkError:
            "Network Error"
        case .decodingError:
           "Decoding Error"
        }
    }
}

protocol GetJokes {
    func execute() async -> Result<[Jokes], UseCaseError>
}

struct GetJokesUseCase: GetJokes {
    private var repo: JokesRepository
    
    init(repo: JokesRepository) {
        self.repo = repo
    }

    func execute() async -> Result<[Jokes], UseCaseError>{
        do{
            let jokes = try await repo.getJokes()
            return .success(jokes)
        } catch(let error){
            switch(error){
            case APIServiceError.decodingError:
                return .failure(.decodingError)
            default:
                return .failure(.networkError)
            }
        }
    }
}
