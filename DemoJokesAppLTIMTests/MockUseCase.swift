//
//  MockUseCase.swift
//  DemoJokesAppLTIMTests
//
//  Created by 61092893 on 04/02/24.
//

import Foundation
@testable import DemoJokesAppLTIM

class MockGetJokesUseCase: GetJokes {
    private var repo: JokesRepository
    
    init(repo: JokesRepository) {
        self.repo = repo
    }
    
    func execute() async -> Result<[Jokes], UseCaseError> {
        Result.success([
            Jokes(joke: "Joke1"),
            Jokes(joke: "Joke2"),
            Jokes(joke: "Joke3")
        ])
    }
}

class MockGetJokesErrorUseCase: GetJokes {
    private var repo: JokesRepository
    
    init(repo: JokesRepository) {
        self.repo = repo
    }
    func execute() async -> Result<[Jokes], UseCaseError> {
        Result.failure(.networkError)
    }
}
