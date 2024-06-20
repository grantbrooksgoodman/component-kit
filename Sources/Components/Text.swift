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

    // Color
    private let foregroundColor: Color
    private let secondaryForegroundColor: Color?

    // Other
    private let font: ComponentKit.Font
    private let text: String

    // MARK: - Init

    public init(
        _ text: String,
        font: ComponentKit.Font,
        foregroundColor: Color,
        secondaryForegroundColor: Color?
    ) {
        self.text = text
        self.font = font
        self.foregroundColor = foregroundColor
        self.secondaryForegroundColor = secondaryForegroundColor
    }

    // MARK: - View

    @ViewBuilder
    public var body: some View {
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

public extension ComponentKit {
    func text(
        _ text: String,
        font: Font = .system,
        foregroundColor: Color,
        secondaryForegroundColor: Color? = nil
    ) -> some View {
        Text(
            text,
            font: font,
            foregroundColor: foregroundColor,
            secondaryForegroundColor: secondaryForegroundColor
        )
    }
}
