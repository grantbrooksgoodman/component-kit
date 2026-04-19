//
//  ComponentKit.swift
//
//  Created by Grant Brooks Goodman.
//  Copyright © NEOTechnica Corporation. All rights reserved.
//

/* Native */
import Foundation

/// The shared instance for creating standard user interface
/// components.
///
/// Use `Components` to access the factory methods for creating
/// text, button, and symbol views:
///
/// ```swift
/// var body: some View {
///     Components.text(
///         "Hello, world!",
///         font: .systemBold(scale: .large),
///         foregroundColor: .primary
///     )
/// }
/// ```
// swiftlint:disable:next identifier_name
public let Components = ComponentKit()

/// A type whose methods create standard text, button, and symbol
/// views.
///
/// You don't create instances of `ComponentKit` directly. Instead,
/// use the shared ``Components`` constant to access the factory
/// methods.
public struct ComponentKit: Sendable {
    fileprivate init() {}
}
