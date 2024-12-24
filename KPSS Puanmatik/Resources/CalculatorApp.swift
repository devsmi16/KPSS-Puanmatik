import SwiftUI
import SwiftData
import GoogleMobileAds
import FirebaseCore
import FirebaseMessaging

@main
struct CalculatorApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    init () {
        let appearanceNav = UINavigationBarAppearance()
        appearanceNav.configureWithOpaqueBackground()
        UINavigationBar.appearance().standardAppearance = appearanceNav
        UINavigationBar.appearance().scrollEdgeAppearance = appearanceNav
        
        let appearanceTab = UITabBarAppearance()
        appearanceTab.configureWithOpaqueBackground()
        UITabBar.appearance().standardAppearance = appearanceTab
        UITabBar.appearance().scrollEdgeAppearance = appearanceTab
        
        // AdMob SDK 
        GADMobileAds.sharedInstance().start(completionHandler: nil)

    }
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
        .modelContainer(for: Result.self)
    }
}

class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate, MessagingDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        Messaging.messaging().delegate = self
        
        UNUserNotificationCenter.current().delegate = self
        
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(options: authOptions,completionHandler: { _, _ in })
        application.registerForRemoteNotifications()
        return true
    }
    
    func application(_ application: UIApplication,
                     didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        Messaging.messaging().apnsToken = deviceToken
    }
    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        print("Firebase registration token: \(String(describing: fcmToken))")
    }
}
