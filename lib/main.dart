import 'package:flutter/material.dart';
import 'package:open_fashion/widget/custom_homefull_card.dart';

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
              HomefullCard(
                  thumbUrl: 'res/images/item_full.png',
                  name: '21WN',
                  title: 'reversible angora cardigan',
                  price: 120,
                  ratting: 4.8,
                  size: ['s', 'm', 'l'])
            ],
          ),
        ),
      ),
    );
  }
}
