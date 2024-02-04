//
//  JokesListViewUnitTest.swift
//  DemoJokesAppLTIMTests
//
//  Created by 61092893 on 29/01/24.
//

import XCTest
@testable import DemoJokesAppLTIM

@MainActor
 class JokesListViewModelUnitTest: XCTestCase {
     func testJokesViewModel_ShouldExist() throws {
        let _ = JokesListViewModel(getJokesUseCase: MockGetJokesUseCase(repo: JokesRepositoryImplementation(dataSource: JokesAPIDataSourceImplementation())))
    }
     
     func testJokesViewModel_Should_Return_An_Empty_Jokes_List() async  throws {
         let vm = JokesListViewModel(getJokesUseCase: MockGetJokesUseCase(repo: JokesRepositoryImplementation(dataSource: JokesAPIDataSourceImplementation())))
         
         let jokes = vm.jokes
         
         XCTAssertEqual(jokes.count, 0)
     }
     
     func testJokesViewModel_Should_Return_2_jokes_when_jokes_is_invoked() async throws {
         let vm = JokesListViewModel(getJokesUseCase: MockGetJokesUseCase(repo: JokesRepositoryImplementation(dataSource: JokesAPIDataSourceImplementation())))
         
         await vm.getJokes()
         let jokes = vm.jokes
         
         XCTAssertEqual(jokes.count, 3)
     }
     
      func testJokesViewModel_Should_display_error_message_when_getJokes_Resluts_InError() async throws {
         let vm = JokesListViewModel(getJokesUseCase: MockGetJokesErrorUseCase(repo: JokesRepositoryImplementation(dataSource: JokesAPIDataSourceImplementation())))
         
         await vm.getJokes()
         let jokes = vm.jokes
         
         
         XCTAssertEqual(jokes.count, 0)
         XCTAssertEqual(vm.errorMessage, "Network Error")
     }
}
