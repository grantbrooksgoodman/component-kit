# ComponentKit

A Swift package for creating styled text, button, and symbol views in SwiftUI.

---

## Table of Contents

- [Overview](#overview)
- [Requirements](#requirements)
- [Installation](#installation)
- [Components](#components)
  - [Creating Text Views](#creating-text-views)
  - [Displaying Symbols](#displaying-symbols)
  - [Creating Buttons](#creating-buttons)
  - [Hierarchical Foreground Colors](#hierarchical-foreground-colors)
- [Configuring Fonts](#configuring-fonts)
  - [Predefined Fonts](#predefined-fonts)
  - [Font Scale](#font-scale)
  - [Custom Fonts](#custom-fonts)
  - [Font Style](#font-style)

---

## Overview

ComponentKit provides methods for creating common user interface elements with a consistent styling API. All views are created through the shared [`Components`](Sources/ComponentKit.swift) constant, providing a uniform and discoverable interface across your codebase.

The library defines distinct types for font configuration – typeface, weight, style, and size – and provides static convenience methods for common configurations. All types conform to `Sendable`, and all component methods are isolated to `@MainActor` for safe use with Swift concurrency.

```swift
import ComponentKit

struct ContentView: View {
    var body: some View {
        VStack {
            Components.text(
                "Welcome",
                font: .systemBold(scale: .large),
                foregroundColor: .primary
            )

            Components.button(
                symbolName: "plus.circle.fill",
                foregroundColor: .blue
            ) {
                addItem()
            }

            Components.symbol(
                "star.fill",
                foregroundColor: .yellow
            )
        }
    }
}
```

---

## Requirements

| Platform | Minimum Version |
| --- | --- |
| iOS | 17.0 |

ComponentKit has no external dependencies.

---

## Installation

ComponentKit is distributed as a Swift package. Add it to your project using [Swift Package Manager](https://docs.swift.org/swiftpm/documentation/packagemanagerdocs/).

---

## Components

All components are accessed through the [`Components`](Sources/ComponentKit.swift) constant. Each method returns a SwiftUI view configured with the specified font and foreground color.

### Creating Text Views

Use [`Components.text`](Sources/Components/Text.swift) to display a styled string:

```swift
Components.text(
    "Hello, world!",
    font: .systemSemibold(scale: .large),
    foregroundColor: .primary
)
```

The `font` parameter defaults to `.system`, a 17-point regular-weight system font. For the full set of predefined fonts, see [Predefined Fonts](#predefined-fonts).

### Displaying Symbols

Use [`Components.symbol`](Sources/Components/Symbol.swift) to display an SF Symbol:

```swift
Components.symbol(
    "star.fill", 
    foregroundColor: .yellow
)
```

By default, the symbol renders at its intrinsic size. To make the symbol resizable – for example, to fill a parent container – set `usesIntrinsicSize` to `false`:

```swift
Components.symbol(
    "heart.fill",
    foregroundColor: .red,
    weight: .semibold,
    usesIntrinsicSize: false
)
```

If the specified name does not match a valid system symbol, a warning symbol is displayed instead.

> **Note:** Passing a non-`nil` value for `weight` has no effect unless `usesIntrinsicSize` is set to `false`.

### Creating Buttons

Create [buttons](Sources/Components/Button.swift) with either an SF Symbol or styled text as the label:

```swift
// SF Symbol button:
Components.button(
    symbolName: "gear",
    foregroundColor: .secondary
) {
    openSettings()
}

// Text button:
Components.button(
    "Continue",
    font: .systemSemibold,
    foregroundColor: .blue
) {
    proceed()
}
```

When the button's content is determined at runtime, pass a [`ButtonType`](Sources/Models/ButtonType.swift) value directly:

```swift
let type: ComponentKit.ButtonType = .symbol(
    "plus",
    weight: nil,
    usesIntrinsicSize: true
)

Components.button(
    type, 
    foregroundColor: .blue
) {
    addItem()
}
```

### Hierarchical Foreground Colors

All components accept an optional `secondaryForegroundColor` parameter. When provided, a hierarchical foreground style is applied, enabling multicolor rendering for SF Symbols and styled text:

```swift
Components.symbol(
    "heart.circle.fill",
    foregroundColor: .red,
    secondaryForegroundColor: .pink
)
```

When `secondaryForegroundColor` is `nil` (the default), a single-color foreground style is used.

---

## Configuring Fonts

ComponentKit defines its own [`Font`](Sources/Models/Font.swift) type that bridges to `SwiftUI.Font`. A font combines two values:

- A **type** ([`FontType`](Sources/Models/FontType.swift)), which specifies the typeface, weight, and style.
- A **scale** ([`FontScale`](Sources/Models/FontScale.swift)), which specifies the point size.

```swift
let heading = ComponentKit.Font(
    .system(style: .bold()),
    scale: .large
)

Components.text(
    "Settings",
    font: heading,
    foregroundColor: .primary
)
```

### Predefined Fonts

For common system font configurations, use the static properties and methods on [`ComponentKit.Font`](Sources/Models/Font.swift). Each property returns a body-sized font at 17 points, and each corresponding method accepts a [`FontScale`](Sources/Models/FontScale.swift) parameter for a different size:

```swift
// 17-point bold:
.systemBold

// 28-point bold:
.systemBold(scale: .large)

// 13-point semibold italic:
.systemSemiboldItalic(scale: .small)
```

Predefined fonts are available in five weights – regular, bold, light, medium, and semibold – each with underlined, italic, and underlined italic variants.

### Font Scale

[`FontScale`](Sources/Models/FontScale.swift) defines a font's point size. The predefined cases correspond to standard iOS Dynamic Type sizes:

| Case | Points | Dynamic Type Size |
|---|---|---|
| `.large` | 28 | Title 1 |
| `.medium` | 17 | Body |
| `.small` | 13 | Footnote |

Use `.custom(_:)` to specify an arbitrary point size:

```swift
.custom(22)
```

For more information on Dynamic Type sizes, see [Typography](https://developer.apple.com/design/human-interface-guidelines/typography#iOS-iPadOS-Dynamic-Type-sizes) in the Human Interface Guidelines.

### Custom Fonts

To use a custom typeface, create a [`Font`](Sources/Models/Font.swift) with a [`.custom`](Sources/Models/FontType.swift) font type and the font's registered name:

```swift
let font = ComponentKit.Font(
    .custom(name: "Avenir-Heavy"),
    scale: .medium
)

Components.text(
    "Hello", 
    font: font, 
    foregroundColor: .primary
)
```

If the specified font name is unavailable at runtime, the system font at the same point size is used as a fallback.

The `custom` case also accepts `isItalic` and `isUnderlined` parameters:

```swift
ComponentKit.Font(
    .custom(
        name: "Avenir-Book", 
        isItalic: true, 
        isUnderlined: true
    ),
    scale: .large
)
```

### Font Style

When using the system typeface, [`FontStyle`](Sources/Models/FontStyle.swift) defines the font's weight alongside optional italic and underline attributes:

```swift
let font = ComponentKit.Font(
    .system(style: .semibold(isItalic: true)),
    scale: .medium
)
```

The available weights are `bold`, `light`, `medium`, `regular`, and `semibold`. Each accepts optional `isItalic` and `isUnderlined` parameters that both default to `false`. Use `custom` to specify an arbitrary `UIFont.Weight`:

```swift
.custom(
    .heavy, 
    isItalic: false, 
    isUnderlined: true
)
```

---

&copy; NEOTechnica Corporation. All rights reserved.
