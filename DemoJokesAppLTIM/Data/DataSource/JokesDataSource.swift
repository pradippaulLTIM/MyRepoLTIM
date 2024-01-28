//
//  JokesDataSource.swift
//  DemoJokesAppLTIM
//
//  Created by 61092893 on 28/01/24.
//

import Foundation

protocol JokesDataSource {
    func getJokes() async throws -> [Jokes]
}
