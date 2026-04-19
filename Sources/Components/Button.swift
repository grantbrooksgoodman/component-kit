//
//  Button.swift
//
//  Created by Grant Brooks Goodman.
//  Copyright © NEOTechnica Corporation. All rights reserved.
//

/* Native */
import Foundation
import SwiftUI

private struct Button: View {
    // MARK: - Properties

    private let action: () -> Void
    private let foregroundColor: Color
    private let secondaryForegroundColor: Color?
    private let type: ComponentKit.ButtonType

    // MARK: - Init

    fileprivate init(
        _ type: ComponentKit.ButtonType,
        foregroundColor: Color,
        secondaryForegroundColor: Color?,
        action: @escaping () -> Void
    ) {
        self.type = type
        self.foregroundColor = foregroundColor
        self.secondaryForegroundColor = secondaryForegroundColor
        self.action = action
    }

    // MARK: - View

    var body: some View {
        SwiftUI.Button {
            action()
        } label: {
            switch type {
            case let .symbol(
                systemName,
                weight: weight,
                usesIntrinsicSize: usesIntrinsicSize
            ):
                Components.symbol(
                    systemName,
                    foregroundColor: foregroundColor,
                    secondaryForegroundColor: secondaryForegroundColor,
                    weight: weight,
                    usesIntrinsicSize: usesIntrinsicSize
                )

            case let .text(
                text,
                font: font,
                isInspectable: isInspectable
            ):
                Components.text(
                    text,
                    font: font,
                    foregroundColor: foregroundColor,
                    secondaryForegroundColor: secondaryForegroundColor,
                    isInspectable: isInspectable
                )
            }
        }
    }
}

@MainActor
public extension ComponentKit {
    /// Creates a button with an SF Symbol label.
    ///
    /// Use this method to create a button that displays an
    /// SF Symbol as its label:
    ///
    /// ```swift
    /// Components.button(
    ///     symbolName: "plus",
    ///     foregroundColor: .blue
    /// ) {
    ///     addItem()
    /// }
    /// ```
    ///
    /// - Parameters:
    ///   - symbolName: The name of the system symbol to display
    ///     as the button's label.
    ///   - foregroundColor: The primary color of the symbol.
    ///   - secondaryForegroundColor: A secondary color for
    ///     hierarchical foreground styling, or `nil` for a
    ///     single-color style. Defaults to `nil`.
    ///   - weight: The font weight to apply to the symbol.
    ///     Defaults to `nil`.
    ///   - usesIntrinsicSize: A Boolean value that determines
    ///     whether the symbol renders at its intrinsic size.
    ///     Defaults to `true`.
    ///   - action: The action to perform when the user triggers
    ///     the button.
    ///
    /// - Returns: A button with an SF Symbol label.
    func button(
        symbolName: String,
        foregroundColor: Color,
        secondaryForegroundColor: Color? = nil,
        weight: SwiftUI.Font.Weight? = nil,
        usesIntrinsicSize: Bool = true,
        action: @escaping () -> Void
    ) -> some View {
        Button(
            .symbol(symbolName, weight: weight, usesIntrinsicSize: usesIntrinsicSize),
            foregroundColor: foregroundColor,
            secondaryForegroundColor: secondaryForegroundColor,
            action: action
        )
    }

    /// Creates a button with a text label.
    ///
    /// Use this method to create a button that displays a styled
    /// string as its label:
    ///
    /// ```swift
    /// Components.button(
    ///     "Continue",
    ///     font: .systemSemibold(scale: .large),
    ///     foregroundColor: .blue
    /// ) {
    ///     proceed()
    /// }
    /// ```
    ///
    /// - Parameters:
    ///   - text: The string to display as the button's label.
    ///   - font: The font to apply to the label text.
    ///   - foregroundColor: The primary color of the label.
    ///   - secondaryForegroundColor: A secondary color for
    ///     hierarchical foreground styling, or `nil` for a
    ///     single-color style. Defaults to `nil`.
    ///   - isInspectable: A Boolean value that indicates whether
    ///     the label includes a hidden inspection marker for
    ///     testing. Defaults to `false`.
    ///   - action: The action to perform when the user triggers
    ///     the button.
    ///
    /// - Returns: A button with a text label.
    func button(
        _ text: String,
        font: Font,
        foregroundColor: Color,
        secondaryForegroundColor: Color? = nil,
        isInspectable: Bool = false,
        action: @escaping () -> Void
    ) -> some View {
        Button(
            .text(text, font: font, isInspectable: isInspectable),
            foregroundColor: foregroundColor,
            secondaryForegroundColor: secondaryForegroundColor,
            action: action
        )
    }

    /// Creates a button with the specified type as its label.
    ///
    /// Use this method when you have a ``ButtonType`` value that
    /// describes the button's content:
    ///
    /// ```swift
    /// let type: ComponentKit.ButtonType = .symbol(
    ///     "gear",
    ///     weight: nil,
    ///     usesIntrinsicSize: true
    /// )
    ///
    /// Components.button(
    ///     type,
    ///     foregroundColor: .secondary
    /// ) {
    ///     openSettings()
    /// }
    /// ```
    ///
    /// For direct creation, prefer
    /// ``button(symbolName:foregroundColor:secondaryForegroundColor:weight:usesIntrinsicSize:action:)``
    /// or
    /// ``button(_:font:foregroundColor:secondaryForegroundColor:isInspectable:action:)``.
    ///
    /// - Parameters:
    ///   - type: The content type that describes the button's
    ///     label.
    ///   - foregroundColor: The primary color of the label.
    ///   - secondaryForegroundColor: A secondary color for
    ///     hierarchical foreground styling, or `nil` for a
    ///     single-color style. Defaults to `nil`.
    ///   - action: The action to perform when the user triggers
    ///     the button.
    ///
    /// - Returns: A button configured with the specified type.
    func button(
        _ type: ButtonType,
        foregroundColor: Color,
        secondaryForegroundColor: Color? = nil,
        action: @escaping () -> Void
    ) -> some View {
        Button(
            type,
            foregroundColor: foregroundColor,
            secondaryForegroundColor: secondaryForegroundColor,
            action: action
        )
    }
}
