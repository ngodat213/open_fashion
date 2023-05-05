import 'package:flutter/material.dart';

import 'package:open_fashion/model/instagram.dart';

import 'package:open_fashion/theme/colors.dart';
import 'package:open_fashion/widget/header.dart';
import 'package:open_fashion/widget/footer.dart';

import 'package:open_fashion/screen/homepage_screen/widget/custom_divider.dart';
import 'package:open_fashion/screen/homepage_screen/widget/custom_collection.dart';
import 'package:open_fashion/screen/homepage_screen/widget/custom_gridview_ig.dart';
import 'package:open_fashion/screen/homepage_screen/widget/custom_causel_slider.dart';
import 'package:open_fashion/screen/homepage_screen/widget/custom_gridview_brand.dart';
import 'package:open_fashion/screen/homepage_screen/widget/custom_tabbar_type_item.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

final urlImages = [
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

class _HomepageScreenState extends State<HomepageScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              HeaderWidget(),
              CustomCauselSlider(urlImages),
              CustomDivider(),
              TabBarTypeItem(tabController: _tabController),
              CustomDivider(),
              CustomGridviewBrand(listBrand: brands),
              CustomDivider(),
              CustomCollection(),
              CustomGridviewIg(listIg: listIg),
              FooterWidget()
            ],
          ),
        ),
      ),
    );
  }
}
