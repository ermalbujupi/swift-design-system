//
//  DSCardTests.swift
//  SwiftUIDesignSystem
//
//  Created by Ermal Bujupaj on 9.2.26.
//


import XCTest
import SwiftUI
@testable import SwiftUIDesignSystem

final class DSCardTests: XCTestCase {
    
    func testInitialization() {
        let card = DSCard {
            Text("Content")
        }
        XCTAssertNotNil(card)
    }
    
    func testWithShadow() {
        let card = DSCard(hasShadow: true) {
            Text("Content")
        }
        XCTAssertNotNil(card)
    }
    
    func testCustomPadding() {
        let card = DSCard(padding: DSSpacing.xl) {
            Text("Content")
        }
        XCTAssertNotNil(card)
    }
    
    func testCustomBackgroundColor() {
        let card = DSCard(backgroundColor: .blue) {
            Text("Content")
        }
        XCTAssertNotNil(card)
    }
    
    func testCustomCornerRadius() {
        let card = DSCard(cornerRadius: 20) {
            Text("Content")
        }
        XCTAssertNotNil(card)
    }
    
    func testAllParametersCombined() {
        let card = DSCard(
            padding: DSSpacing.lg,
            backgroundColor: DSColors.backgroundSecondary,
            cornerRadius: 16,
            hasShadow: true
        ) {
            Text("Content")
        }
        XCTAssertNotNil(card)
    }
}
