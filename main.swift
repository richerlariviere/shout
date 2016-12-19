import Foundation

extension Bundle {
    func fakeBundleIdentifier() -> NSString {
        if self == Bundle.main {
            return "com.richerlariviere"
        } else {
            return self.fakeBundleIdentifier()
        }
    }
}

func fakeBundleIdentifier() {
    if let aClass = objc_getClass("NSBundle") as? AnyClass {
        method_exchangeImplementations(
            class_getInstanceMethod(aClass, #selector(getter: Bundle.bundleIdentifier)),
            class_getInstanceMethod(aClass, #selector(Bundle.fakeBundleIdentifier))
        )
    }
}

fakeBundleIdentifier()

func presentNotification(time: Float?, message: String) {
    let notification = NSUserNotification()
    notification.identifier = "\(NSDate().timeIntervalSince1970)"
    notification.title = "Task completed"
    notification.informativeText = "Command: \(message)"

    if let totalSeconds = time {
        let hours:Int = Int(totalSeconds.truncatingRemainder(dividingBy: 86400) / 3600)
        let minutes:Int = Int(totalSeconds.truncatingRemainder(dividingBy: 3600) / 60)
        let seconds:Int = Int(totalSeconds.truncatingRemainder(dividingBy: 60))
        notification.subtitle = String(format: "%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    NSUserNotificationCenter.default.deliver(notification)
}

var arguments = CommandLine.arguments

if(arguments.count >= 3) {
    presentNotification(time: Float(arguments[1]), message: arguments[1..<arguments.count].joined(separator:" "))
}

sleep(1)
