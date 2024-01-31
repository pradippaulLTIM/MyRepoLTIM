//
//  JokesListViewUnitTest.swift
//  DemoJokesAppLTIMTests
//
//  Created by 61092893 on 29/01/24.
//

import XCTest
@testable import DemoJokesAppLTIM

class MockGetJokesUseCase: GetTodos{
    func execute() async -> Result<[Todo], UseCaseError> {
        Result.success([
            Todo(id: 1, title: "Mock Title One", isCompleted: true),
            Todo(id: 2, title: "Mock Title Two", isCompleted: false)
        ])
    }
}
final class JokesListViewModelUnitTest: XCTestCase {

  

}
