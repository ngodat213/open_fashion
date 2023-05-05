import 'package:flutter/material.dart';
import 'screen/search_view_screen/search_view_screen.dart';
import 'screen/homepage_screen/homepage_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomepageScreen(),
    );
  }
}
