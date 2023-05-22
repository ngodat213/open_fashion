import 'package:flutter/material.dart';

import 'package:open_fashion/model/user_ig.dart';
import 'package:open_fashion/screen/homepage_screen/widget/custom_criteria.dart';

import 'package:open_fashion/theme/colors.dart';
import 'package:open_fashion/theme/txt_styles.dart';
import 'package:open_fashion/widget/header.dart';
import 'package:open_fashion/widget/footer.dart';

import 'package:open_fashion/screen/homepage_screen/widget/custom_divider.dart';
import 'package:open_fashion/screen/homepage_screen/widget/custom_collection.dart';
import 'package:open_fashion/screen/homepage_screen/widget/custom_gridview_ig.dart';
import 'package:open_fashion/screen/homepage_screen/widget/custom_causel_slider.dart';
import 'package:open_fashion/screen/homepage_screen/widget/custom_gridview_brand.dart';
import 'package:open_fashion/screen/homepage_screen/widget/custom_tabbar_type_item.dart';

import '../../model/features.dart';
import '../../model/item.dart';
import 'widget/custom_listview_product.dart';
import 'widget/tag_trending.dart';

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

final List<Item> listItem = [
  Item(
    thumbUrl: 'res/images/product.png',
    name: '21WN ',
    title: 'reversible angora cardigan',
    price: 120,
    ratting: 10,
    size: ['s', 'm', 'l'],
  ),
  Item(
    thumbUrl: 'res/images/item.png',
    name: '21WN ',
    title: 'reversible angora cardigan',
    price: 120,
    ratting: 10,
    size: ['s', 'm', 'l'],
  ),
  Item(
    thumbUrl: 'res/images/item.png',
    name: '21WN ',
    title: 'reversible angora cardigan',
    price: 120,
    ratting: 10,
    size: ['s', 'm', 'l'],
  ),
  Item(
    thumbUrl: 'res/images/item.png',
    name: '21WN ',
    title: 'reversible angora cardigan',
    price: 120,
    ratting: 10,
    size: ['s', 'm', 'l'],
  )
];

final List<Features> features = [
  new Features(
    'res/images/ms1.png',
    'Fast shipping. Free on orders over \$25.',
  ),
  new Features(
    'res/images/ms2.png',
    'Sustainable process from start to finish.',
  ),
  new Features(
    'res/images/ms3.png',
    'Unique designs and high-quality materials.',
  ),
  new Features(
    'res/images/ms4.png',
    'Fast shipping. Free on orders over \$25.',
  ),
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
              TabBarTypeItem(tabController: _tabController, items: listItem),
              CustomDivider(),
              CustomGridviewBrand(listBrand: brands),
              CustomDivider(),
              CustomCollection(),
              CustomJustForYou(items: listItem),
              TagTrending(tags: tags),
              Column(
                children: [
                  SizedBox(height: 64),
                  Image.asset('res/images/logo.png'),
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    width: 280,
                    child: Text(
                      'Making a luxurious lifestyle accessible for a generous group of women is our daily drive.',
                      textAlign: TextAlign.center,
                      style: TxtStyle.font14(AppColors.titleActive),
                    ),
                  ),
                  CustomDivider(),
                  SizedBox(height: 25),
                  GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 13,
                      mainAxisSpacing: 11,
                      mainAxisExtent: 68,
                    ),
                    itemCount: features.length,
                    itemBuilder: (context, index) {
                      return CustomCriteria(
                        features[index].imagePath,
                        features[index].title,
                      );
                    },
                  ),
                  SizedBox(height: 33),
                  Image.asset('res/images/end.png')
                ],
              ),
              SizedBox(height: 35),
              CustomGridviewIg(listIg: listIg),
              FooterWidget()
            ],
          ),
        ),
      ),
    );
  }
}
