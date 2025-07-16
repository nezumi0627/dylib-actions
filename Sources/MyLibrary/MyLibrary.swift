import Foundation
#if canImport(UIKit)
import UIKit
#endif
#if canImport(AppKit) && !targetEnvironment(macCatalyst)
import AppKit
#endif

private let _dylibLoaded: Void = {
    #if canImport(UIKit)
    DispatchQueue.main.async {
        if let rootVC = UIApplication.shared.windows.first?.rootViewController {
            let alert = UIAlertController(title: "[MyLibrary]", message: "dylib loaded", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            rootVC.present(alert, animated: true)
        } else {
            fputs("[MyLibrary] dylib loaded (UIKit, no root VC)\n", stderr)
        }
    }
    #elseif canImport(AppKit) && !targetEnvironment(macCatalyst)
    DispatchQueue.main.async {
        let alert = NSAlert()
        alert.messageText = "[MyLibrary]"
        alert.informativeText = "dylib loaded"
        alert.addButton(withTitle: "OK")
        alert.runModal()
    }
    #else
    fputs("[MyLibrary] dylib loaded\n", stderr)
    #endif
}()

public func greet() {
    _ = _dylibLoaded
    print("Hello from MyLibrary!")
}
