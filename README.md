<img src="https://www.kabirasani.com/images/silicon.png" alt="" />

Silicon is a minimalist DSL for UIKit that transforms your Auto Layout constraints from verbose to elegant, cumbersom to expressive.

## Installation

### Swift Package Manager

[Swift Package Manager](https://swift.org/package-manager/) is a tool for managing the distribution of Swift code. It’s integrated with the Swift build system to automate the process of downloading, compiling, and linking dependencies.

To integrate Silicon into your Xcode project using Swift Package Manager, add it to the dependencies value of your `Package.swift`:

```swift
dependencies: [
    .package(
        url: "https://github.com/kabir-asani/Silicon.git",
        .upToNextMajor(from: "0.0.2")
    )
]
```

> You can follow a complete guide for installation from [here](https://swiftpackageindex.com/kabir-asani/Silicon).

## Usage

## QuickStart

```swift
import Silicon

class FeedViewController: UIViewController {
    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)

        // pins top, left, right and bottom anchors of tableView to view's corresponding anchors
        tableView.pin(to: view)
    }
}
```

## License

Silicon is released under the MIT license. See `LICENSE` for details.
