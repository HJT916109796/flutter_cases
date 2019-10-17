import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:async';
//import 'package:flutter_flipperkit/flutter_flipperkit.dart';
import 'package:oktoast/oktoast.dart';
import 'package:flutter_cases/flutter_cases.dart';
import 'package:flutter_cases_example/utils/toast.dart';

void main() {
  // 插件初始化
  config();

  runApp(MyApp());
}

/// 插件初始化
void config() async {

  /// TODO:flutter 调试工具
//  FlipperClient flipperClient = FlipperClient.getDefault();
//  flipperClient.addPlugin(new FlipperNetworkPlugin());
//  flipperClient.addPlugin(new FlipperSharedPreferencesPlugin());
//  flipperClient.start();


}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await FlutterCases.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    // TODO: ScreenUtil 初始化
    //ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
  }
  @override
  Widget build(BuildContext context) {

    return OKToast(
      textPadding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 10,
        bottom: 10,
      ),
      radius: 12,
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: const Text('Flutter Cases Summary'),
          ),
          body: GestureDetector(
            child: Center(
              child: Text('BACBon: $_platformVersion\n'),
            ),
            onTap: () {
              Toast.show('哈哈');
            },
          ),
        ),
      ),
    );
  }
}
