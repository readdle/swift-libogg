# swift-ogg
A basic Swift Package wrapper for `libogg` from [xiph/ogg](https://github.com/xiph/ogg).

# Usage
Add a dependency to your Swift Package definition.
The example below is in `swift-tools-version: 5.4` syntax:
```swift
let package = Package(
    name: "MyPackage",
    products: [.library(name: "MyLib", targets: ["MyLib"])],
    dependencies: [
        .package(url: "https://github.com/readdle/swift-ogg.git", .upToNextMinor(from: "1.3.5")),
    ],
    targets: [
        .target(
            name: "MyLib",
            dependencies: [
                .product(name: "Ogg", package: "swift-ogg"),
            ],
…
```
Import C module in your code and use [ogg API](https://www.xiph.org/ogg/doc/libogg/reference.html):
```swift
import COgg

var streamState = ogg_stream_state()
var headerPacket = ogg_packet()
var oggPage = ogg_page()

ogg_stream_init(&streamState, Int32(Date().timeIntervalSince1970))

// Prepare required header packets

ogg_stream_packetin(&streamState, &headerPacket)
…

while ogg_stream_flush(&streamState, &oggPage) != 0 {
    // Process page data, e.g. write to file
}
```

# Versioning
As it is only a wrapper, versioning strictly follows the original.
Version `1.3.5` would correspond to official [v1.3.5](https://github.com/xiph/ogg/releases/tag/v1.3.5) release
and so on.

# Licenses
This project is under MIT license. `libogg` sources are
from [xiph/ogg repository](https://github.com/xiph/ogg) and are licensed under
the [BSD-3-Clause license](https://github.com/xiph/ogg?tab=BSD-3-Clause-1-ov-file#BSD-3-Clause-1-ov-file).
