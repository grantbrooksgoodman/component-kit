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

    // Color
    private let foregroundColor: Color
    private let secondaryForegroundColor: Color?

    // Other
    private let action: () -> Void
    private let type: ComponentKit.ButtonType

    // MARK: - Init

    public init(
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

    public var body: some View {
        SwiftUI.Button {
            action()
        } label: {
            switch type {
            case let .symbol(systemName, weight: weight, usesIntrinsicSize: usesIntrinsicSize):
                Components.symbol(
                    systemName,
                    foregroundColor: foregroundColor,
                    secondaryForegroundColor: secondaryForegroundColor,
                    weight: weight,
                    usesIntrinsicSize: usesIntrinsicSize
                )

            case let .text(text, font: font):
                Components.text(
                    text,
                    font: font,
                    foregroundColor: foregroundColor,
                    secondaryForegroundColor: secondaryForegroundColor
                )
            }
        }
    }
}

public extension ComponentKit {
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

    func button(
        _ text: String,
        font: Font,
        foregroundColor: Color,
        secondaryForegroundColor: Color? = nil,
        action: @escaping () -> Void
    ) -> some View {
        Button(
            .text(text, font: font),
            foregroundColor: foregroundColor,
            secondaryForegroundColor: secondaryForegroundColor,
            action: action
        )
    }

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
