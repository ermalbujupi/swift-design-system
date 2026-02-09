//
//  DSToggleTests.swift
//  SwiftUIDesignSystem
//
//  Created by Ermal Bujupaj on 9.2.26.
//


import XCTest
import SwiftUI
@testable import SwiftUIDesignSystem

@MainActor
final class DSToggleTests: XCTestCase {
    
    func testInitialization() {
        let binding = Binding.constant(true)
        let toggle = DSToggle("Dark Mode", isOn: binding)
        XCTAssertNotNil(toggle)
    }
    
    func testDefaultLabelPosition() {
        let binding = Binding.constant(false)
        let toggle = DSToggle("Setting", isOn: binding)
        XCTAssertEqual(toggle.labelPosition, .leading)
    }
    
    func testTrailingLabelPosition() {
        let binding = Binding.constant(false)
        let toggle = DSToggle("Setting", isOn: binding, labelPosition: .trailing)
        XCTAssertEqual(toggle.labelPosition, .trailing)
    }
    
    func testLeadingLabelPosition() {
        let binding = Binding.constant(true)
        let toggle = DSToggle("Setting", isOn: binding, labelPosition: .leading)
        XCTAssertEqual(toggle.labelPosition, .leading)
    }
    
    func testAllLabelPositionsExist() {
        let positions: [DSToggle.LabelPosition] = [.leading, .trailing]
        let binding = Binding.constant(true)
        
        for position in positions {
            let toggle = DSToggle("Test", isOn: binding, labelPosition: position)
            XCTAssertNotNil(toggle)
        }
    }
}
