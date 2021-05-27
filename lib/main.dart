import 'package:flutter/material.dart';
import 'screens/stream_provider.dart';
import 'widget/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StreamProvider Flutter',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: MyStreamProvider(),
    );
  }
}