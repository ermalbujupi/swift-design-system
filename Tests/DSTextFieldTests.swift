//
//  DSTextFieldTests.swift
//  SwiftUIDesignSystem
//
//  Created by Ermal Bujupaj on 9.2.26.
//


import XCTest
import SwiftUI
@testable import SwiftUIDesignSystem

@MainActor
final class DSTextFieldTests: XCTestCase {
    
    func testInitialization() {
        let binding = Binding.constant("test")
        let textField = DSTextField("Placeholder", text: binding)
        XCTAssertNotNil(textField)
    }
    
    func testDefaultStyle() {
        let binding = Binding.constant("")
        let textField = DSTextField("Email", text: binding)
        XCTAssertEqual(textField.style, .default)
    }
    
    func testErrorStyle() {
        let binding = Binding.constant("")
        let textField = DSTextField("Email", text: binding, style: .error)
        XCTAssertEqual(textField.style, .error)
    }
    
    func testDisabledStyle() {
        let binding = Binding.constant("")
        let textField = DSTextField("Email", text: binding, style: .disabled)
        XCTAssertEqual(textField.style, .disabled)
    }
    
    func testWithLabel() {
        let binding = Binding.constant("")
        let textField = DSTextField("Enter email", text: binding, label: "Email Address")
        XCTAssertNotNil(textField)
    }
    
    func testWithErrorMessage() {
        let binding = Binding.constant("taken")
        let textField = DSTextField(
            "Username",
            text: binding,
            style: .error,
            errorMessage: "Username already taken"
        )
        XCTAssertNotNil(textField)
    }
    
    func testAllStylesExist() {
        let styles: [DSTextField.Style] = [.default, .error, .disabled]
        let binding = Binding.constant("")
        
        for style in styles {
            let textField = DSTextField("Test", text: binding, style: style)
            XCTAssertNotNil(textField)
        }
    }
}
