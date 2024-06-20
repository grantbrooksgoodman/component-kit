//
//  ForegroundColorViewModifier.swift
//
//  Created by Grant Brooks Goodman.
//  Copyright © NEOTechnica Corporation. All rights reserved.
//

/* Native */
import Foundation
import SwiftUI

private struct ForegroundColorViewModifier: ViewModifier {
    // MARK: - Properties

    private let primary: Color
    private let secondary: Color?

    // MARK: - Init

    public init(_ primary: Color, _ secondary: Color?) {
        self.primary = primary
        self.secondary = secondary
    }

    // MARK: - Body

    public func body(content: Content) -> some View {
        if let secondary {
            content
                .foregroundStyle(primary, secondary)
                .tint(primary)
        } else {
            content
                .foregroundStyle(primary)
                .tint(primary)
        }
    }
}

extension View {
    func foregroundColor(_ primary: Color, _ secondary: Color?) -> some View {
        modifier(ForegroundColorViewModifier(primary, secondary))
    }
}
