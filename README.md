# Spacer

A Swift Package that simplifies layout adjustments by allowing the placement of spacers based on `Edge.Set` positions. This package helps maintain clean, readable code while enhancing layout flexibility in SwiftUI.

## Features

- Place `Spacer` in specific locations (`.leading`, `.trailing`, `.top`, `.bottom`, `.horizontal`, `.vertical` `.all`) with a single modifier.
- Set minimum lengths for each spacer, providing full control over layout gaps.
- Streamline complex layouts while keeping SwiftUI code readable.

## Usage

Use `.spacer()` modifier with `Edge.Set` and optional `minLength` to add flexible spacing to your views.

### Ex) Leading Spacer

```swift
Text("Leading Text")
    .spacer(.leading)
```

### Ex) Trailing Spacer

```swift
Text("Trailing Text")
    .spacer(.trailing, minLength: 10)
```

### Ex) Spacer for vertical stacks

```swift
import Spacer

struct ContentView: View {
  var body: some View {
    VStack {
      MyLabel("My Label")
        .spacer(.trailing)

      MyButton("My Button") {
        print("Button tapped")
      }
      .spacer(.bottom, minLength: 20)
    }
  }
}
```

## Requirements

- iOS 13.0+

## Installation

### Swift Package Manager

[Swift Package Manager](https://swift.org/package-manager/) is a tool for managing the distribution of Swift code. It’s integrated with the Swift build system to automate the process of downloading, compiling, and linking dependencies.

To integrate `Spacer` into your Xcode project using Swift Package Manager, add it to the dependencies value of your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/99yuseong/Spacer.git", .upToNextMajor(from: "1.0.0"))
]
```
