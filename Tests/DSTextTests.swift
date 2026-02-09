//
//  DSTextTests.swift
//  SwiftUIDesignSystem
//
//  Created by Ermal Bujupaj on 9.2.26.
//

import XCTest
import SwiftUI
@testable import SwiftUIDesignSystem

@MainActor
final class DSTextTests: XCTestCase {
    
    func testInitialization() {
        let text = DSText("Hello")
        XCTAssertNotNil(text)
    }
    
    func testDefaultValues() {
        let text = DSText("Hello")
        XCTAssertEqual(text.style, .body)
        XCTAssertEqual(text.color, .primary)
    }
    
    func testCustomStyleAndColor() {
        let text = DSText("Title", style: .title1, color: .destructive)
        XCTAssertEqual(text.style, .title1)
        XCTAssertEqual(text.color, .destructive)
    }
    
    func testAllStylesExist() {
        // Verify all styles can be instantiated
        let styles: [DSText.TextStyle] = [
            .largeTitle, .title1, .title2, .title3,
            .headline, .body, .subheadline,
            .footnote, .callout, .caption
        ]
        
        for style in styles {
            let text = DSText("Test", style: style)
            XCTAssertNotNil(text)
        }
    }
    
    func testAllColorsExist() {
        // Verify all colors can be instantiated
        let colors: [DSText.ColorStyle] = [
            .primary, .secondary, .destructive, .success,
            .custom(.purple)
        ]
        
        for color in colors {
            let text = DSText("Test", color: color)
            XCTAssertNotNil(text)
        }
    }
}
