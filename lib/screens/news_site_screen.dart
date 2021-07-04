import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class NewsSiteScreen extends StatelessWidget {
  final String url;
  NewsSiteScreen(this.url);
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: url,
    );
  }
}
