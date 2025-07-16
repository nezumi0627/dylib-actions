import UIKit

private let _dylibLoaded: Void = {
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let rootVC = windowScene.windows.first(where: { $0.isKeyWindow })?.rootViewController {

            let alert = UIAlertController(title: "[MyLibrary]", message: "dylib がロードされました", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "おけ", style: .default))
            rootVC.present(alert, animated: true)
        }
    }
}()

public func greet() {
    _ = _dylibLoaded
    print("Hello from MyLibrary!")
}
