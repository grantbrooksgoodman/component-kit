//
//  Symbol.swift
//
//  Created by Grant Brooks Goodman.
//  Copyright © NEOTechnica Corporation. All rights reserved.
//

/* Native */
import Foundation
import SwiftUI

private struct Symbol: View {
    // MARK: - Constants Accessors

    private typealias Strings = ComponentKit.Constants.Strings.Symbol

    // MARK: - Properties

    private let foregroundColor: Color
    private let secondaryForegroundColor: Color?
    private let systemName: String
    private let usesIntrinsicSize: Bool
    private let weight: Font.Weight?

    // MARK: - Computed Properties

    private var intrinsicSizeImage: Image {
        guard let image: UIImage = .init(systemName: systemName) else {
            guard let image: UIImage = .init(systemName: Strings.fallbackImageSystemName) else {
                return .init(uiImage: .init())
            }

            return .init(uiImage: image).renderingMode(.template)
        }

        return .init(uiImage: image).renderingMode(.template)
    }

    private var resizableImage: Image {
        .init(systemName: systemName).renderingMode(.template)
    }

    // MARK: - Init

    fileprivate init(
        _ systemName: String,
        foregroundColor: Color,
        secondaryForegroundColor: Color?,
        weight: Font.Weight?,
        usesIntrinsicSize: Bool
    ) {
        self.systemName = systemName
        self.foregroundColor = foregroundColor
        self.secondaryForegroundColor = secondaryForegroundColor
        self.weight = weight
        self.usesIntrinsicSize = usesIntrinsicSize
    }

    // MARK: - View

    @ViewBuilder
    var body: some View {
        if usesIntrinsicSize {
            intrinsicSizeImage
                .dynamicTypeSize(.large)
                .foregroundColor(foregroundColor, secondaryForegroundColor)
        } else {
            resizableImage
                .resizable()
                .antialiased(true)
                .aspectRatio(contentMode: .fit)
                .dynamicTypeSize(.large)
                .fontWeight(weight)
                .foregroundColor(foregroundColor, secondaryForegroundColor)
        }
    }
}

@MainActor
public extension ComponentKit {
    /// Creates a symbol image view for the specified system symbol
    /// name.
    ///
    /// Use this method to display an SF Symbol in your interface:
    ///
    /// ```swift
    /// Components.symbol(
    ///     "star.fill",
    ///     foregroundColor: .yellow
    /// )
    /// ```
    ///
    /// By default, the symbol renders at its intrinsic size. To
    /// make the symbol resizable – for example, to fill a parent
    /// container – set `usesIntrinsicSize` to `false`:
    ///
    /// ```swift
    /// Components.symbol(
    ///     "heart.fill",
    ///     foregroundColor: .red,
    ///     weight: .semibold,
    ///     usesIntrinsicSize: false
    /// )
    /// ```
    ///
    /// - Parameters:
    ///   - systemName: The name of the system symbol to display.
    ///     If the name does not match a valid system symbol, a
    ///     warning symbol is displayed instead.
    ///   - foregroundColor: The primary color of the symbol.
    ///   - secondaryForegroundColor: A secondary color for
    ///     hierarchical foreground styling, or `nil` for a
    ///     single-color style. Defaults to `nil`.
    ///   - weight: The font weight to apply to the symbol.
    ///     Defaults to `nil`.
    ///   - usesIntrinsicSize: A Boolean value that determines
    ///     whether the symbol renders at its intrinsic size. Pass
    ///     `false` to make the symbol resizable. Defaults to
    ///     `true`.
    ///
    /// - Returns: A view that displays the specified symbol.
    ///
    /// - Note: Passing a non-`nil` value for `weight` has no
    ///   effect unless `usesIntrinsicSize` is set to `false`.
    func symbol(
        _ systemName: String,
        foregroundColor: Color,
        secondaryForegroundColor: Color? = nil,
        weight: SwiftUI.Font.Weight? = nil,
        usesIntrinsicSize: Bool = true
    ) -> some View {
        Symbol(
            systemName,
            foregroundColor: foregroundColor,
            secondaryForegroundColor: secondaryForegroundColor,
            weight: weight,
            usesIntrinsicSize: usesIntrinsicSize
        )
    }
}
