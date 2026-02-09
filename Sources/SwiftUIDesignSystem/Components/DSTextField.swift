//
//  File.swift
//  SwiftUIDesignSystem
//
//  Created by Ermal Bujupaj on 9.2.26.
//

import SwiftUI

/// A styled text input field with optional label and error message.
///
/// Usage:
/// ```swift
/// DSTextField("Email", text: $email)
/// DSTextField("Username", text: $username, style: .error, errorMessage: "Username taken")
/// ```
public struct DSTextField: View {
    
    public enum Style {
        case `default`
        case error
        case disabled
    }
    
    // MARK: - Properties

    @Binding private var text: String

    let style: Style

    private let placeholder: String
    private let label: String?
    private let errorMessage: String?
    
    // MARK: - Init
    
    public init(
        _ placeholder: String,
        text: Binding<String>,
        style: Style = .default,
        label: String? = nil,
        errorMessage: String? = nil
    ) {
        self.placeholder = placeholder
        self._text = text
        self.style = style
        self.label = label
        self.errorMessage = errorMessage
    }
    
    // MARK: - Body
    
    public var body: some View {
        VStack(alignment: .leading, spacing: DSSpacing.xxs) {
            // Label
            if let label {
                DSText(label, style: .subheadline, color: .secondary)
            }
            
            // Text field
            TextField(placeholder, text: $text)
                .padding(DSSpacing.sm)
                .background(DSColors.backgroundSecondary)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(borderColor, lineWidth: 1)
                )
                .disabled(style == .disabled)
                .opacity(style == .disabled ? 0.6 : 1)
            
            // Error message
            if let errorMessage {
                DSText(errorMessage, style: .caption, color: .destructive)
            }
        }
    }
    
    // MARK: - Computed Properties
    
    private var borderColor: Color {
        switch style {
        case .default:
            return DSColors.border
        case .error:
            return DSColors.destructive
        case .disabled:
            return DSColors.border.opacity(0.5)
        }
    }
}

#Preview("Default") {
    
    @Previewable @State var text: String = ""
    DSTextField("Email", text: $text, label: "Email Address")
        .padding()
    
}

#Preview("With Value") {
    @Previewable @State var text: String = "ermal@example.com"
    DSTextField("Email", text: $text, label: "Email Address")
        .padding()
}

#Preview("Error State") {
    @Previewable @State var text: String = "ermal"
    DSTextField("Username", text: $text, style: .error, label: "Username", errorMessage: "Username already taken")
        .padding()
}

#Preview("Disabled") {
    @Previewable @State var text: String = "Can't edit this"
    DSTextField("Disabled", text: $text, style: .disabled, label: "Locked Field")
        .padding()
}
