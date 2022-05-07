import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

void main() {
  statusBarColor:
  Colors.pink;
  runApp(const WebViewPlusExample());
}

class WebViewPlusExample extends StatelessWidget {
  const WebViewPlusExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarColor: Color(0xFFffb400)),
        ),
      ),
      home: const WebViewPlusExampleMainPage(),
    );
  }
}

class WebViewPlusExampleMainPage extends StatefulWidget {
  const WebViewPlusExampleMainPage({Key? key}) : super(key: key);

  @override
  _WebViewPlusExampleMainPageState createState() =>
      _WebViewPlusExampleMainPageState();
}

class _WebViewPlusExampleMainPageState
    extends State<WebViewPlusExampleMainPage> {
  WebViewPlusController? _controller;
  double _height = 1000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: _height,
            child: WebViewPlus(
              javascriptChannels: null,
              initialUrl: '',
              onWebViewCreated: (controller) {
                _controller = controller;
              },
              onPageFinished: (url) {
                _controller?.getHeight().then((double height) {
                  print("Height: " + height.toString());
                  setState(() {
                    _height = height;
                  });
                });
              },
              javascriptMode: JavascriptMode.unrestricted,
            ),
          )
        ],
      ),
    );
  }
}
