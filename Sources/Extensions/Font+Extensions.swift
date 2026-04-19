//
//  Font+Extensions.swift
//
//  Created by Grant Brooks Goodman.
//  Copyright © NEOTechnica Corporation. All rights reserved.
//

/* Native */
import Foundation

public extension ComponentKit.Font {
    // MARK: - Regular

    /// System font with `.regular` weight and a size of `17` points.
    static var system: ComponentKit.Font { .system(scale: .medium) }

    /// System font with `.regular` weight at the specified scale.
    static func system(scale: ComponentKit.FontScale) -> ComponentKit.Font {
        .init(
            .system(style: .regular()),
            scale: scale
        )
    }

    // MARK: - Regular Underlined

    /// System font with `.regular` weight, underlined style, and a size of `17` points.
    static var systemUnderlined: ComponentKit.Font { .systemUnderlined(scale: .medium) }

    /// System font with `.regular` weight and underlined style at the specified scale.
    static func systemUnderlined(scale: ComponentKit.FontScale) -> ComponentKit.Font {
        .init(
            .system(style: .regular(isUnderlined: true)),
            scale: scale
        )
    }

    // MARK: - Regular Italic

    /// System font with `.regular` weight, italic style, and a size of `17` points.
    static var systemItalic: ComponentKit.Font { .systemItalic(scale: .medium) }

    /// System font with `.regular` weight and italic style at the specified scale.
    static func systemItalic(scale: ComponentKit.FontScale) -> ComponentKit.Font {
        .init(
            .system(style: .regular(isItalic: true)),
            scale: scale
        )
    }

    // MARK: - Regular Underlined Italic

    /// System font with `.regular` weight, underlined italic style, and a size of `17` points.
    static var systemUnderlinedItalic: ComponentKit.Font { .systemUnderlinedItalic(scale: .medium) }

    /// System font with `.regular` weight and underlined italic style at the specified scale.
    static func systemUnderlinedItalic(scale: ComponentKit.FontScale) -> ComponentKit.Font {
        .init(
            .system(style: .regular(isItalic: true, isUnderlined: true)),
            scale: scale
        )
    }

    // MARK: - Bold

    /// System font with `.bold` weight and a size of `17` points.
    static var systemBold: ComponentKit.Font { .systemBold(scale: .medium) }

    /// System font with `.bold` weight at the specified scale.
    static func systemBold(scale: ComponentKit.FontScale) -> ComponentKit.Font {
        .init(
            .system(style: .bold()),
            scale: scale
        )
    }

    // MARK: - Bold Underlined

    /// System font with `.bold` weight, underlined style, and a size of `17` points.
    static var systemBoldUnderlined: ComponentKit.Font { .systemBoldUnderlined(scale: .medium) }

    /// System font with `.bold` weight and underlined style at the specified scale.
    static func systemBoldUnderlined(scale: ComponentKit.FontScale) -> ComponentKit.Font {
        .init(
            .system(style: .bold(isUnderlined: true)),
            scale: scale
        )
    }

    // MARK: - Bold Italic

    /// System font with `.bold` weight, italic style, and a size of `17` points.
    static var systemBoldItalic: ComponentKit.Font { .systemBoldItalic(scale: .medium) }

    /// System font with `.bold` weight and italic style at the specified scale.
    static func systemBoldItalic(scale: ComponentKit.FontScale) -> ComponentKit.Font {
        .init(
            .system(style: .bold(isItalic: true)),
            scale: scale
        )
    }

    // MARK: - Bold Underlined Italic

    /// System font with `.bold` weight, underlined italic style, and a size of `17` points.
    static var systemBoldUnderlinedItalic: ComponentKit.Font { .systemBoldUnderlinedItalic(scale: .medium) }

    /// System font with `.bold` weight and underlined italic style at the specified scale.
    static func systemBoldUnderlinedItalic(scale: ComponentKit.FontScale) -> ComponentKit.Font {
        .init(
            .system(style: .bold(isItalic: true, isUnderlined: true)),
            scale: scale
        )
    }

    // MARK: - Light

    /// System font with `.light` weight and a size of `17` points.
    static var systemLight: ComponentKit.Font { .systemLight(scale: .medium) }

    /// System font with `.light` weight at the specified scale.
    static func systemLight(scale: ComponentKit.FontScale) -> ComponentKit.Font {
        .init(
            .system(style: .light()),
            scale: scale
        )
    }

    // MARK: - Light Underlined

    /// System font with `.light` weight, underlined style, and a size of `17` points.
    static var systemLightUnderlined: ComponentKit.Font { .systemLightUnderlined(scale: .medium) }

    /// System font with `.light` weight and underlined style at the specified scale.
    static func systemLightUnderlined(scale: ComponentKit.FontScale) -> ComponentKit.Font {
        .init(
            .system(style: .light(isUnderlined: true)),
            scale: scale
        )
    }

    // MARK: - Light Italic

    /// System font with `.light` weight, italic style, and a size of `17` points.
    static var systemLightItalic: ComponentKit.Font { .systemLightItalic(scale: .medium) }

    /// System font with `.light` weight and italic style at the specified scale.
    static func systemLightItalic(scale: ComponentKit.FontScale) -> ComponentKit.Font {
        .init(
            .system(style: .light(isItalic: true)),
            scale: scale
        )
    }

    // MARK: - Light Underlined Italic

    /// System font with `.light` weight, underlined italic style, and a size of `17` points.
    static var systemLightUnderlinedItalic: ComponentKit.Font { .systemLightUnderlinedItalic(scale: .medium) }

    /// System font with `.light` weight and underlined italic style at the specified scale.
    static func systemLightUnderlinedItalic(scale: ComponentKit.FontScale) -> ComponentKit.Font {
        .init(
            .system(style: .light(isItalic: true, isUnderlined: true)),
            scale: scale
        )
    }

    // MARK: - Medium

    /// System font with `.medium` weight and a size of `17` points.
    static var systemMedium: ComponentKit.Font { .systemMedium(scale: .medium) }

    /// System font with `.medium` weight at the specified scale.
    static func systemMedium(scale: ComponentKit.FontScale) -> ComponentKit.Font {
        .init(
            .system(style: .medium()),
            scale: scale
        )
    }

    // MARK: - Medium Underlined

    /// System font with `.medium` weight, underlined style, and a size of `17` points.
    static var systemMediumUnderlined: ComponentKit.Font { .systemMediumUnderlined(scale: .medium) }

    /// System font with `.medium` weight and underlined style at the specified scale.
    static func systemMediumUnderlined(scale: ComponentKit.FontScale) -> ComponentKit.Font {
        .init(
            .system(style: .medium(isUnderlined: true)),
            scale: scale
        )
    }

    // MARK: - Medium Italic

    /// System font with `.medium` weight, italic style, and a size of `17` points.
    static var systemMediumItalic: ComponentKit.Font { .systemMediumItalic(scale: .medium) }

    /// System font with `.medium` weight and italic style at the specified scale.
    static func systemMediumItalic(scale: ComponentKit.FontScale) -> ComponentKit.Font {
        .init(
            .system(style: .medium(isItalic: true)),
            scale: scale
        )
    }

    // MARK: - Medium Underlined Italic

    /// System font with `.medium` weight, underlined italic style, and a size of `17` points.
    static var systemMediumUnderlinedItalic: ComponentKit.Font { .systemMediumUnderlinedItalic(scale: .medium) }

    /// System font with `.medium` weight and underlined italic style at the specified scale.
    static func systemMediumUnderlinedItalic(scale: ComponentKit.FontScale) -> ComponentKit.Font {
        .init(
            .system(style: .medium(isItalic: true, isUnderlined: true)),
            scale: scale
        )
    }

    // MARK: - Semibold

    /// System font with `.semibold` weight and a size of `17` points.
    static var systemSemibold: ComponentKit.Font { .systemSemibold(scale: .medium) }

    /// System font with `.semibold` weight at the specified scale.
    static func systemSemibold(scale: ComponentKit.FontScale) -> ComponentKit.Font {
        .init(
            .system(style: .semibold()),
            scale: scale
        )
    }

    // MARK: - Semibold Underlined

    /// System font with `.semibold` weight, underlined style, and a size of `17` points.
    static var systemSemiboldUnderlined: ComponentKit.Font { .systemSemiboldUnderlined(scale: .medium) }

    /// System font with `.semibold` weight and underlined style at the specified scale.
    static func systemSemiboldUnderlined(scale: ComponentKit.FontScale) -> ComponentKit.Font {
        .init(
            .system(style: .semibold(isUnderlined: true)),
            scale: scale
        )
    }

    // MARK: - Semibold Italic

    /// System font with `.semibold` weight, italic style, and a size of `17` points.
    static var systemSemiboldItalic: ComponentKit.Font { .systemSemiboldItalic(scale: .medium) }

    /// System font with `.semibold` weight and italic style at the specified scale.
    static func systemSemiboldItalic(scale: ComponentKit.FontScale) -> ComponentKit.Font {
        .init(
            .system(style: .semibold(isItalic: true)),
            scale: scale
        )
    }

    // MARK: - Semibold Underlined Italic

    /// System font with `.semibold` weight, underlined italic style, and a size of `17` points.
    static var systemSemiboldUnderlinedItalic: ComponentKit.Font { .systemSemiboldUnderlinedItalic(scale: .medium) }

    /// System font with `.semibold` weight and underlined italic style at the specified scale.
    static func systemSemiboldUnderlinedItalic(scale: ComponentKit.FontScale) -> ComponentKit.Font {
        .init(
            .system(style: .semibold(isItalic: true, isUnderlined: true)),
            scale: scale
        )
    }
}
