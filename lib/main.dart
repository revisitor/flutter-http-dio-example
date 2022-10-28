import 'package:flutter/material.dart';
import 'package:web_app/web_view.dart';

void main() {
  const app = WebApplication();
  runApp(app);
}

class WebApplication extends StatelessWidget {
  const WebApplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WebView(),
    );
  }
}
