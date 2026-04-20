//
//  Text.swift
//
//  Created by Grant Brooks Goodman.
//  Copyright © NEOTechnica Corporation. All rights reserved.
//

/* Native */
import Foundation
import SwiftUI

private struct Text: View {
    // MARK: - Properties

    private let font: ComponentKit.Font
    private let foregroundColor: Color
    private let isInspectable: Bool
    private let secondaryForegroundColor: Color?
    private let text: String

    // MARK: - Init

    fileprivate init(
        _ text: String,
        font: ComponentKit.Font,
        foregroundColor: Color,
        isInspectable: Bool,
        secondaryForegroundColor: Color?
    ) {
        self.text = text
        self.font = font
        self.foregroundColor = foregroundColor
        self.isInspectable = isInspectable
        self.secondaryForegroundColor = secondaryForegroundColor
    }

    // MARK: - View

    @ViewBuilder
    var body: some View {
        if isInspectable {
            contentView
                .inspectable(text.hashValue)
        } else {
            contentView
        }
    }

    @ViewBuilder
    private var contentView: some View {
        let text = SwiftUI.Text(text)
            .dynamicTypeSize(.large)
            .font(font.model)
            .foregroundColor(foregroundColor, secondaryForegroundColor)

        switch font.type {
        case let .custom(_, _, isUnderlined):
            if isUnderlined {
                text.underline()
            } else {
                text
            }

        case let .system(style):
            if style.isUnderlined {
                text.underline()
            } else {
                text
            }
        }
    }
}

@MainActor
public extension ComponentKit {
    /// Creates a text view with the specified font and foreground
    /// color.
    ///
    /// Use this method to display a styled string in your
    /// interface:
    ///
    /// ```swift
    /// Components.text(
    ///     "Hello, world!",
    ///     font: .systemBold(scale: .large),
    ///     foregroundColor: .primary
    /// )
    /// ```
    ///
    /// To apply a secondary foreground color for hierarchical
    /// styling, pass a value for `secondaryForegroundColor`:
    ///
    /// ```swift
    /// Components.text(
    ///     "Important",
    ///     font: .systemSemibold,
    ///     foregroundColor: .red,
    ///     secondaryForegroundColor: .orange
    /// )
    /// ```
    ///
    /// - Parameters:
    ///   - text: The string to display.
    ///   - font: The font to apply to the text. Defaults to
    ///     ``Font/system``.
    ///   - foregroundColor: The primary color of the text.
    ///   - secondaryForegroundColor: A secondary color for
    ///     hierarchical foreground styling, or `nil` for a
    ///     single-color style. Defaults to `nil`.
    ///   - isInspectable: A Boolean value that indicates whether
    ///     the view is inspectable within the view hierarchy.
    ///     Defaults to `false`.
    ///
    /// - Returns: A text view styled with the specified font and
    ///   color.
    func text(
        _ text: String,
        font: Font = .system,
        foregroundColor: Color,
        secondaryForegroundColor: Color? = nil,
        isInspectable: Bool = false
    ) -> some View {
        Text(
            text,
            font: font,
            foregroundColor: foregroundColor,
            isInspectable: isInspectable,
            secondaryForegroundColor: secondaryForegroundColor
        )
    }
}
