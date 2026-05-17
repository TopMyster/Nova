# Nova

Nova is an iOS browser app built with SwiftUI.

## Build and Run in Xcode

1. Open the project in Xcode.
2. Select the `Nova` project in the Project Navigator.
3. Select the `Nova` app target.
4. Open `Signing & Capabilities`.
5. Enable `Automatically manage signing`.
6. Choose your Apple ID team.
7. Set a unique bundle identifier, such as `com.yourname.Nova`.
8. Select a run destination:
   - Use an iPhone connected by USB or Wi-Fi to run on a device.
   - Use an iOS Simulator to run locally on your Mac.
9. Press `Command + R` or choose `Product > Run`.

If you are using a free Apple ID, Xcode can install the app on your own device for testing, but it usually cannot export a normal signed `.ipa`.

## Archive or Export

To create an archive:

1. Select `Any iOS Device` as the destination.
2. Choose `Product > Archive`.
3. When Organizer opens, select the archive.
4. Choose `Distribute App`.

A paid Apple Developer Program membership is required for TestFlight, App Store distribution, Ad Hoc distribution, and reliable `.ipa` export.
