//
//  JokesViewModel.swift
//  DemoJokesAppLTIM
//
//  Created by 61092893 on 28/01/24.
//

import Foundation

@MainActor
class JokesListViewModel: ObservableObject {

    var getJokesUseCase = GetJokesUseCase(repo: JokesRepositoryImplementation(dataSource: JokesAPIDataSourceImplementation()))
    @Published var jokes: [Jokes] = []
    @Published var errorMessage = ""
    @Published var hasError = false
    @Published var loading = false

    func getJokes() async {
        self.loading = true
        errorMessage = ""
        let result = await getJokesUseCase.execute()
        self.loading = false
        switch result{
        case .success(let jokes):
            self.jokes = jokes
        case .failure(let error):
            self.jokes = []
            errorMessage = error.description
            hasError = true
        }
    }
}
