import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:open_fashion/theme/colors.dart';
import 'package:open_fashion/widget/appbar.dart';
import 'package:open_fashion/widget/footer.dart';

import 'package:open_fashion/screen/homepage_screen/widget/custom_divider.dart';
import 'package:open_fashion/screen/homepage_screen/widget/custom_collection.dart';
import 'package:open_fashion/screen/homepage_screen/widget/custom_gridview_ig.dart';
import 'package:open_fashion/screen/homepage_screen/widget/custom_causel_slider.dart';
import 'package:open_fashion/screen/homepage_screen/widget/custom_gridview_brand.dart';
import 'package:open_fashion/screen/homepage_screen/widget/custom_tabbar_type_item.dart';
import 'package:open_fashion/widget/search_drawer.dart';

import '../../model/user_ig.dart';
import '../../model/product.dart';
import '../../widget/menu_drawer.dart';
import 'widget/custom_listview_product.dart';
import 'widget/features_app.dart';
import 'widget/tag_trending.dart';

import 'package:flutter/services.dart' as rootBundle;

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

final urlImages = [
  "res/images/image_slider.png",
  "res/images/image_slider.png",
  "res/images/image_slider.png",
  "res/images/image_slider.png",
];

final brands = [
  'res/images/Catier.png',
  'res/images/Catier.png',
  'res/images/Catier.png',
  'res/images/Catier.png',
  'res/images/Catier.png',
  'res/images/Catier.png'
];

final listIg = [
  Instagram(imageUrl: 'res/images/avatarIg.png', username: 'mia'),
  Instagram(imageUrl: 'res/images/avatarIg.png', username: 'mia'),
  Instagram(imageUrl: 'res/images/avatarIg.png', username: 'mia'),
  Instagram(imageUrl: 'res/images/avatarIg.png', username: 'mia'),
];

final List<String> tags = [
  '#2021',
  '#spring',
  '#collection',
  '#fall',
  '#dress',
  '#autumncollection',
  '#openfashion'
];

class _HomepageScreenState extends State<HomepageScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    List<Product> products = await getDataJson();
    setState(() {
      listItems = products;
    });
  }

  Future<List<Product>> getDataJson() async {
    final jsondata =
        await rootBundle.rootBundle.loadString("lib/json/product.json");
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => Product.fromJson(e)).toList();
  }

  List<Product> listItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      drawer: MenuDrawer(),
      endDrawer: SearchDrawer(),
      backgroundColor: AppColors.offWhite,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              CustomCauselSlider(urlImages),
              TabBarTypeItem(items: listItems),
              CustomDivider(),
              CustomGridviewBrand(listBrand: brands),
              CustomDivider(),
              CustomCollection(),
              CustomJustForYou(items: listItems),
              TagTrending(tags: tags),
              FeaturesApp(),
              SizedBox(height: 35),
              CustomGridviewIg(listIg: listIg),
              FooterWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
