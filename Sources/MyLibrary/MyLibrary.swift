import Foundation

private let _dylibLoaded: Void = {
    fputs("[MyLibrary] dylib loaded\n", stderr)
}()

@_cdecl("greet") public func greet() {
    _ = _dylibLoaded
    print("Hello from MyLibrary!")
}