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

    public init(
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
    public var body: some View {
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

public extension ComponentKit {
    /// - Note: Passing a non-`nil` value for `weight` will have no effect unless `usesIntrinsicSize` is set to `false`.
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
