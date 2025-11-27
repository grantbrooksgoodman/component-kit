//
//  InspectableViewModifier.swift
//
//  Created by Grant Brooks Goodman.
//  Copyright © NEOTechnica Corporation. All rights reserved.
//

/* Native */
import Foundation
import SwiftUI

private struct Inspectable: UIViewRepresentable {
    // MARK: - Properties

    private let id: Int

    // MARK: - Init

    init(_ id: Int) {
        self.id = id
    }

    // MARK: - Make UIView

    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        label.isAccessibilityElement = false
        label.isHidden = true
        label.isUserInteractionEnabled = false
        return label
    }

    // MARK: - Update UIView

    func updateUIView(
        _ uiView: UILabel,
        context: Context
    ) {
        uiView.tag = id
    }
}

private struct InspectableModifier: ViewModifier {
    // MARK: - Properties

    private let id: Int

    // MARK: - Init

    init(_ id: Int) {
        self.id = id
    }

    // MARK: - Methods

    func body(content: Content) -> some View {
        content.background(Inspectable(id))
    }
}

extension View {
    func inspectable(_ id: Int) -> some View {
        modifier(InspectableModifier(id))
    }
}
