import UIKit
import Flutter
import GoogleMaps
@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
  GMSServices.provideAPIKey("AIzaSyBFw2Br0iNavYg_3K3xfRukESdc1XtyPpg")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
