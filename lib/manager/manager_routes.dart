import 'package:flutter/material.dart';
import 'package:open_fashion/screen/blog_screen/blog_screen.dart';
import 'package:open_fashion/screen/category_view_screen/category_view_screen.dart';
import 'package:open_fashion/screen/check_out_commit/check_out_commit.dart';
import 'package:open_fashion/screen/check_out_method/check_out_method.dart';
import 'package:open_fashion/screen/check_out_screen/check_out_screen.dart';
import 'package:open_fashion/screen/homepage_screen/homepage_screen.dart';
import 'package:open_fashion/screen/our_story_screen/our_story_screen.dart';
import 'package:open_fashion/screen/search_view_screen/search_view_screen.dart';

class ManagerRoutes {
  ManagerRoutes._();
  static String homePage = '/home_page';
  static String categoryViewScreen = '/category_view';
  static String blogScreen = '/blog_screen';
  static String searchScreen = '/search_screen';
  static String checkoutScreen = '/check_out_screen';
  static String ourStory = '/our_story_screen';
  static String checkoutMethod = '/check_out_method';
  static String checkoutCommit = '/check_out_commit';

  static Map<String, Widget Function(BuildContext)> manager = {
    homePage: (context) => const HomepageScreen(),
    categoryViewScreen: (context) => const CategoryView(),
    blogScreen: (context) => const BlogScreen(),
    searchScreen: (context) => const SearchViewScreen(),
    checkoutScreen: (context) => const CheckOutScreen(),
    ourStory: (context) => const OurStoryScreen(),
    checkoutMethod: (context) => const CheckOutMethod(),
    checkoutCommit: (context) => const CheckOutCommit(),
  };
}
