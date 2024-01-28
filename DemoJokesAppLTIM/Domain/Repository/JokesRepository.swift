//
//  JokesRepository.swift
//  DemoJokesAppLTIM
//
//  Created by 61092893 on 28/01/24.
//

import Foundation

protocol JokesRepository {
    func getJokes() async throws -> [Jokes]
}

struct JokesRepositoryImplementation: JokesRepository {
    var dataSource: JokesDataSource

    init(dataSource: JokesDataSource) {
        self.dataSource = dataSource
    }

    func getJokes() async throws -> [Jokes] {
        let _jokes =  try await dataSource.getJokes()
        return _jokes
    }
}
