import 'package:flutter/material.dart';
import 'package:open_fashion/manager/manager_routes.dart';
import 'screen/category_view_screen/category_view_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final urlImages = [
      "https://i.pinimg.com/564x/7e/6a/5c/7e6a5c3164efd7fb323f2c49e11658bc.jpg",
      "https://i.pinimg.com/564x/7e/6a/5c/7e6a5c3164efd7fb323f2c49e11658bc.jpg",
      "https://i.pinimg.com/564x/7e/6a/5c/7e6a5c3164efd7fb323f2c49e11658bc.jpg",
      "https://i.pinimg.com/564x/7e/6a/5c/7e6a5c3164efd7fb323f2c49e11658bc.jpg",
    ];
    final List<String> tags = ['#Fashion', '#Tips'];
    return MaterialApp(
      routes: ManagerRoutes.manager,
      home: CategoryView(),
      // BlogScreen(),
      // BlogPostScreen(fashionPost: urlImages, tags: tags),
    );
  }
}
