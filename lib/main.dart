import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:open_fashion/manager/manager_routes.dart';
import 'package:open_fashion/model/product.dart';
import 'package:open_fashion/screen/check_out_screen/check_out_screen.dart';
import 'package:open_fashion/screen/homepage_screen/homepage_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: ManagerRoutes.manager,
      home: CheckOutScreen(),
    );
  }
}
