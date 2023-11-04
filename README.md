# To get a Google Maps API key for a Flutter app, follow these steps:

1. Go to the Google Cloud Platform Console: https://cloud.google.com/maps-platform/. 
2. Click the hamburger menu in the top left corner. 
3. Select APIs & Services > Library. 
4. Search for and select the Google Maps Platform API. 
5. Click Enable. 
6. Click the Credentials tab. 
7. Click Create credentials > API key. 
8. Select the Restrictions tab. 
9. Under API restrictions, select Restrict key. 
10. In the HTTP referrers section, add the following URLs:
    https://*.flutter.io
    https://*.flutter.dev
    https://localhost:8080
11. Click Create.

# Once you have created your API key, you need to add it to your Flutter project. To do this:

1. Open your Flutter project in a text editor. 
2. Navigate to the android/app/src/main/AndroidManifest.xml file. 
3. Add the following meta-data entry to the application node:

    # Android
    <meta-data
    android:name="com.google.android.geo.API_KEY"
    android:value="YOUR_API_KEY" />
    
    # IOS
    import UIKit
    import Flutter
    import GoogleMaps
    
    @UIApplicationMain
    @objc class AppDelegate: FlutterAppDelegate {
    override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
    GMSServices.provideAPIKey("YOUR KEY HERE")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    }

4. Replace YOUR_API_KEY with your actual API key.
5. Save the file.

# Android
*Set the minSdkVersion in android/app/build.gradle:*
android {
    defaultConfig {
    minSdkVersion 20
    }
}

# Now, you can start using Google Maps in your Flutter app. To do this, you need to install the google_maps_flutter package. To do this:

**flutter pub add google_maps_flutter**

# Complete Documentation ==> https://pub.dev/packages/google_maps_flutter



