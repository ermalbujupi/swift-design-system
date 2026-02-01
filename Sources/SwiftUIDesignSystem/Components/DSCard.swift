//
//  DSCard.swift
//  SwiftUIDesignSystem
//
//  Created by Ermal Bujupaj on 31.1.26.
//

import SwiftUI

public struct DSCard<Content: View>: View {
    
    // MARK: - Properties
    private let padding: CGFloat
    private let backgroundColor: Color
    private let cornerRadius: CGFloat
    private let hasShadow: Bool
    private let content: Content
    
    // MARK: - Initialization

    /// Creates a new DSCard
    /// - Parameters:
    ///   - padding: Inner spacing around content (default: DSSpacing.md)
    ///   - backgroundColor: Card fill color (default: DSColors.backgroundSecondary)
    ///   - cornerRadius: Corner radius in points (default: 12)
    ///   - hasShadow: Whether to show drop shadow (default: false)
    ///   - content: Views to display inside the card
    public init(
        padding: CGFloat = DSSpacing.md,
        backgroundColor: Color = DSColors.backgroundSecondary,
        cornerRadius: CGFloat = 12,
        hasShadow: Bool = false,
        @ViewBuilder content: () -> Content
    ) {
        self.padding = padding
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
        self.hasShadow = hasShadow
        self.content = content()
    }

    
    // MARK: - Body
    
    public var body: some View {
        content
            .padding(padding)
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            .shadow(
                color: hasShadow ? Color.black.opacity(0.8) : .clear,
                radius: hasShadow ? 8 : 0,
                x: 5,
                y: hasShadow ? 5 : 0
            )
    }
}

#Preview("Basic") {
    DSCard {
        DSText("Simple card", style: .headline)
    }
    .padding()
}

#Preview("With Shadow") {
    DSCard(hasShadow: true) {
        DSText("Card with shadow", style: .headline)
    }
    .padding()
}

#Preview("Custom Padding") {
    DSCard(padding: DSSpacing.xl) {
        DSText("Large padding", style: .body)
    }
    .padding()
}

#Preview("Full Example") {
    DSCard(hasShadow: true) {
        VStack(alignment: .leading, spacing: DSSpacing.sm) {
            DSText("Card Title", style: .headline)
            DSText("This is the card body text with more details.", style: .body, color: .secondary)
            DSButton("Action", style: .primary) { }
        }
    }
    .padding()
}
