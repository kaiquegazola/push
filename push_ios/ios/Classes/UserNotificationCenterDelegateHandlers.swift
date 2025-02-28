import Foundation

class UserNotificationCenterDelegateHandlers: NSObject, UNUserNotificationCenterDelegate {
    private let originalDelegate: UNUserNotificationCenterDelegate?
    private let pushFlutterApi: PUPushFlutterApi

    init(with originalDelegate: UNUserNotificationCenterDelegate?, pushFlutterApi: PUPushFlutterApi) {
        self.originalDelegate = originalDelegate
        self.pushFlutterApi = pushFlutterApi
        super.init()
    }

    func userNotificationCenter(_: UNUserNotificationCenter, willPresent notification: UserNotifications.UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        // When a foreground notification is delivered and the user schedules a local notification, this is called twice.
        // - First, when the notification is received from APNs directly. To be consistent with Android behaviour, we ignore it. In this case, notification.request.trigger is a `UNPushNotificationTrigger`
        // - When received from flutter_local_notifications, I want to display it. In this case, notification.request.trigger is nil.
        if notification.request.trigger is UNPushNotificationTrigger {
            let message = PURemoteMessage.from(userInfo: notification.request.content.userInfo)
            pushFlutterApi.onMessageMessage(message) { _ in
            }
            // Do not display the notification received from APNs
            completionHandler([])
        } else {
            // Display the local notification.
            if #available(iOS 14.0, *) {
                completionHandler(.banner)
            } else {
                completionHandler(.alert)
            }
        }
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        pushFlutterApi.onNotificationTapData(response.notification.request.content.userInfo as! [String: Any]) { _ in }
        callOriginalDidReceiveDelegateMethod(center: center, response: response, completionHandler: completionHandler)
    }

    // Allow users original UNUserNotificationCenterDelegate they set to respond.
    private func callOriginalDidReceiveDelegateMethod(center: UNUserNotificationCenter, response: UNNotificationResponse, completionHandler: @escaping () -> Void) { // `as` is used because userNotificationCenter on its own is ambiguous (userNotificationCenter corresponds to 3 methods).
        // See https://stackoverflow.com/questions/35658334/how-do-i-resolve-ambiguous-use-of-compile-error-with-swift-selector-syntax
        let didReceiveDelegateMethodSelector = #selector(userNotificationCenter as (UNUserNotificationCenter, UNNotificationResponse, @escaping () -> Void) -> Void)
        if let originalDelegate = originalDelegate, originalDelegate.responds(to: didReceiveDelegateMethodSelector) {
            originalDelegate.userNotificationCenter?(center, didReceive: response, withCompletionHandler: completionHandler)
        } else {
            completionHandler()
        }
    }

    @available(iOS 12.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, openSettingsFor notification: UserNotifications.UNNotification?) {
        pushFlutterApi.onOpenNotificationSettings { _ in
        }
        callOriginalOpenSettingsForDelegateMethod(center: center, notification: notification)
    }

    @available(iOS 12.0, *)
    private func callOriginalOpenSettingsForDelegateMethod(center: UNUserNotificationCenter, notification: UserNotifications.UNNotification?) {
        let openSettingsForDelegateMethodSelector = #selector(userNotificationCenter as (UNUserNotificationCenter, UNNotification?) -> Void)
        if let originalDelegate = originalDelegate, originalDelegate.responds(to: openSettingsForDelegateMethodSelector) {
            originalDelegate.userNotificationCenter?(center, openSettingsFor: notification)
        }
    }
}
