//
//  Jokes.swift
//  DemoJokesAppLTIM
//
//  Created by 61092893 on 28/01/24.
//

import Foundation

struct Jokes: Identifiable {
    var id: UUID = .init()
    let joke: String
}

struct JokesEntity: Codable {
    let joke: String
}


