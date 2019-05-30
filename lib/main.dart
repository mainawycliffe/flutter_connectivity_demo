import 'package:flutter/material.dart';
import 'dart:async';
import 'package:connectivity/connectivity.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const title = 'Flutter Connectivity Demo';

    return MaterialApp(
      title: '$title',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '$title'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  final Stream<ConnectivityResult> subscription =
      Connectivity().onConnectivityChanged;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: StreamBuilder(
          stream: subscription,
          builder: (BuildContext context,
              AsyncSnapshot<ConnectivityResult> snapshot) {
            TextStyle style = Theme.of(context).textTheme.display3;
            const double iconSize = 200;

            switch (snapshot.data) {
              case ConnectivityResult.mobile:
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      Icons.network_cell,
                      size: iconSize,
                      color: Colors.red,
                    ),
                    Text(
                      'Mobile Data',
                      style: style,
                    )
                  ],
                );
                break;
              case ConnectivityResult.wifi:
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      Icons.network_wifi,
                      size: iconSize,
                      color: Colors.red,
                    ),
                    Text(
                      'WiFi',
                      style: style,
                    )
                  ],
                );
                break;
              default:
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      Icons.signal_cellular_off,
                      size: iconSize,
                      color: Colors.grey,
                    ),
                    Text(
                      'No Network!',
                      style: style,
                    )
                  ],
                );
            }
          },
        ),
      ),
    );
  }
}
