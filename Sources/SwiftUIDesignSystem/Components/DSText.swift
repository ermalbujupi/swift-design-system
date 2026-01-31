//
//  DSText.swift
//  SwiftUIDesignSystem
//
//  Created by Ermal Bujupaj on 31.1.26.
//

import SwiftUI

public struct DSText: View {
    
    public enum TextStyle {
        case largeTitle
        case title1
        case title2
        case title3
        case headline
        case body
        case subheadline
        case footnote
        case callout
        case caption
    }
    
    public enum ColorStyle {
        case primary
        case secondary
        case destructive
        case success
        case custom(Color)
    }
    
    // MARK: - Properties
    private let text: String
    private let style: TextStyle
    private let color: ColorStyle
    
    // MARK: - Initialization
    
    /// Creates a new DSText
    /// - Parameters:
    ///   - text: The text to display
    ///   - style: Typography style (default: .body) 
    ///   - color: Text color variant (default: .primary)
    public init(
        _ text: String,
        style: TextStyle = .body,
        color: ColorStyle = .primary
    ) {
        self.text = text
        self.style = style
        self.color = color
    }
    
    public var body: some View {
        Text(text)
            .font(.system(textStyle))
            .foregroundStyle(textColor)
    }
    
    private var textStyle: Font.TextStyle {
        switch style {
        case .largeTitle:
            return Font.TextStyle.largeTitle
        case .title1:
            return Font.TextStyle.title
        case .title2:
            return Font.TextStyle.title2
        case .title3:
            return Font.TextStyle.title3
        case .headline:
            return Font.TextStyle.headline
        case .body:
            return Font.TextStyle.body
        case .subheadline:
            return Font.TextStyle.subheadline
        case .footnote:
            return Font.TextStyle.footnote
        case .callout:
            return Font.TextStyle.callout
        case .caption:
            return Font.TextStyle.caption
        }
    }
    
    private var textColor: Color {
        switch color {
        case .primary:
            return DSColors.textPrimary
            case .secondary:
            return DSColors.textSecondary
        case .destructive:
            return DSColors.destructive
        case .success:
            return DSColors.success
        case .custom(let color):
            return color
        }
    }
}

#Preview {
    VStack(alignment: .leading, spacing: DSSpacing.sm) {
        DSText("Hello")
        DSText("Title", style: .title1)
        DSText("Error", style: .body, color: .destructive)
    }
    .padding()
}

#Preview("All Styles") {
    VStack(alignment: .leading, spacing: DSSpacing.sm) {
        DSText("Large Title", style: .largeTitle)
        DSText("Title 1", style: .title1)
        DSText("Title 2", style: .title2)
        DSText("Title 3", style: .title3)
        DSText("Headline", style: .headline)
        DSText("Body", style: .body)
        DSText("Subheadline", style: .subheadline)
        DSText("Footnote", style: .footnote)
        DSText("Callout", style: .callout)
        DSText("Caption", style: .caption)
    }
    .padding()
}

#Preview("Colors") {
    VStack(alignment: .leading, spacing: DSSpacing.sm) {
        DSText("Primary", style: .body, color: .primary)
        DSText("Secondary", style: .body, color: .secondary)
        DSText("Destructive", style: .body, color: .destructive)
        DSText("Success", style: .body, color: .success)
    }
    .padding()
}
