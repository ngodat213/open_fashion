import 'package:flutter/material.dart';
import 'package:open_fashion/widget/custom_cart_widget.dart';
import 'package:open_fashion/widget/custom_button_add2basket.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              CartWidget(),
              AddToBesket(),
            ],
          ),
        ),
      ),
    );
  }
}
