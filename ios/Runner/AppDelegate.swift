import UIKit
import Flutter
import GoogleMaps
@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    GMSServices.provideAPIkey("AIzaSyCbS7ERP8ZISv6WtbmtAnefVK-az9i9tFY")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
