import 'package:amap_flutter_location/amap_flutter_location.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("定位测试"),),
        body: InkWell(
            onTap: (){
              startLocation();
            },
            child: Center(child: Text("点击获取位置"),)),
      ),
    );
  }

  startLocation() async {
    AMapFlutterLocation.setApiKey("b1c9563bbe8e83215bc48bc35190ae35","b1c9563bbe8e83215bc48bc35190ae35");
    await Permission.location.request();
    var location = AMapFlutterLocation();
    location.startLocation();
    location.onLocationChanged().listen((event) {
      debugPrint("$event");
    });
  }
}
