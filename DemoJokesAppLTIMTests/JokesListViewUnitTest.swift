//
//  JokesListViewUnitTest.swift
//  DemoJokesAppLTIMTests
//
//  Created by 61092893 on 29/01/24.
//

import XCTest
@testable import DemoJokesAppLTIM

class MockGetJokesUseCase: GetJokes{
    func execute() async -> Result<[Jokes], UseCaseError> {
        Result.success([
            Jokes(joke: "Joke1"),
            Jokes(joke: "Joke2")
        ])
    }
}
 class JokesListViewModelUnitTest: XCTestCase {
    @MainActor func testJokesViewModel_ShouldExist() {
        let _ = JokesListViewModel()
    }
     
     @MainActor func testJokesViewModel_Should_Return_An_Empty_Jokes_List()  {
         let vm = JokesListViewModel()
         
         let jokes = vm.jokes
         
         XCTAssertEqual(jokes.count, 0)
     }
     
//     @MainActor func testJokesViewModel_Should_Return_2_jokes_when_jokes_is_invoked() async throws {
//         let vm = JokesListViewModel()
//         
//         let jokes: () = await vm.getJokes()
//         
//         XCTAssertEqual(jokes.count, 0)
//     }
//     
//     @MainActor func testJokesViewModel_Should_display_error_message_when_getJokes_Resluts_InError() async throws {
//         let vm = JokesListViewModel()
//         
//         let jokes: () = await vm.getJokes()
//         
//         XCTAssertEqual(jokes.count, 0)
//     }
}
