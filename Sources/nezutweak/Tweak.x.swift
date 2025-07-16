import Orion
import UIKit

struct HelloWorldTweak: Tweak {
    func tweakDidActivate() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            guard let window = UIApplication.shared.windows.first,
                  let rootVC = window.rootViewController else {
                NSLog("hello world")
                return
            }
            let alert = UIAlertController(title: nil, message: "hello world", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            rootVC.present(alert, animated: true)
        }
    }
}
