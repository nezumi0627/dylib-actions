import Foundation
import UIKit

private let _dylibLoaded: Void = {
    DispatchQueue.main.async {
        // iOS 13 以降の WindowScene 対応
        let rootVC: UIViewController?
        if #available(iOS 13.0, *) {
            rootVC = UIApplication.shared
                .connectedScenes
                .compactMap { $0 as? UIWindowScene }
                .flatMap { $0.windows }
                .first(where: { $0.isKeyWindow })?
                .rootViewController
        } else {
            rootVC = UIApplication.shared.keyWindow?.rootViewController
        }

        if let rootVC = rootVC {
            let alert = UIAlertController(title: "[MyLibrary]", message: "dylib loaded", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            rootVC.present(alert, animated: true)
        } else {
            fputs("[MyLibrary] dylib loaded (no root ViewController found)\n", stderr)
        }
    }
}()

public func greet() {
    _ = _dylibLoaded
    print("Hello from MyLibrary!")
}
