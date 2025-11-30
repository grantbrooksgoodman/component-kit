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

    public init(
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
    public var body: some View {
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

public extension ComponentKit {
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
