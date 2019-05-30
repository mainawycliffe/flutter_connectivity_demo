# Flutter Demo - Connectivity Plugin Demo

![Flutter Demo - Connectivity Plugin Demo](demo/demo.gif)

This a simple demos for using the [Connectivity Plugin Demo](https://pub.dev/packages/connectivity).

The demos taps into the `Stream<ConnectivityResult>` provided the plugin and rebuilding the widget using the `StreamBuilder` everytime the connectivity status changes.

```dart
final Stream<ConnectivityResult> subscription = Connectivity().onConnectivityChanged;
```

And then:

```dart
StreamBuilder(
    stream: subscription,
    builder: (BuildContext context, AsyncSnapshot<ConnectivityResult> snapshot) {
        switch (snapshot.data) {
            case ConnectivityResult.mobile:
            // connection on mobile
            break;
            case ConnectivityResult.wifi:
            // connection on wifi
            break;
            default:
            // no network connection
        }
    },
)

```

Please note the following:

> "NB: Note that on Android, this does not guarantee connection to Internet. For instance, the app might have wifi access but it might be a VPN or a hotel WiFi with no access."
