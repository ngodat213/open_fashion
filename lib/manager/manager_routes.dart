import 'package:flutter/material.dart';
import 'package:open_fashion/screen/blog_screen/blog_screen.dart';
import 'package:open_fashion/screen/category_view_screen/category_view_screen.dart';
import 'package:open_fashion/screen/homepage_screen/homepage_screen.dart';
import 'package:open_fashion/screen/search_view_screen/search_view_screen.dart';

class ManagerRoutes {
  ManagerRoutes._();
  static String homePage = '/home_page';
  static String categoryViewScreen = '/category_view';
  static String blogScreen = '/blog_screen';
  static String productDetail = '/product_detail';
  static String searchScreen = '/search_screen';
  static Map<String, Widget Function(BuildContext)> manager = {
    homePage: (context) => const HomepageScreen(),
    categoryViewScreen: (context) => const CategoryView(),
    blogScreen: (context) => const BlogScreen(),
    searchScreen: (context) => const SearchViewScreen(),
  };
}
