//
//  DateViewModelTests.swift
//  CentralizedDependenciesTests
//
//  Created by Manu on 29/02/2024.
//

import Foundation

import XCTest
@testable import CentralizedDependencies

final class DateViewModelTests: XCTestCase {

    func test_currentDate_argentina() {
        // Given
        // Set Up World
        Current.date = { .distantFuture }
        Current.locale = .init(identifier: "es-AR")
        Current.timeZone = .init(abbreviation: "GMT-3")!
        let viewModel = DateViewModel()

        // When
        let actualString = viewModel.currentFormattedDate()

        // Then
        XCTAssertEqual(actualString, "domingo, 31 de diciembre de 4000, 21:00:00 GMT-03:00")
    }

    func test_currentDate_london() {
        // Given
        // Set Up World
        Current.date = { .distantFuture }
        Current.locale = .init(identifier: "en-UK")
        Current.timeZone = .init(abbreviation: "UTC")!
        let viewModel = DateViewModel()

        // When
        let actualString = viewModel.currentFormattedDate()

        // Then
        XCTAssertEqual(actualString, "Monday, 1 January 4001 at 00:00:00 Greenwich Mean Time")
    }
}
