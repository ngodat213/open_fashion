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
import '../../model/features.dart';
import '../../model/product.dart';
import '../../widget/menu_drawer.dart';
import 'widget/custom_listview_product.dart';
import 'widget/features_app.dart';
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

final List<Product> listItem = [
  Product(
    imageSlider: [
      'res/images/product.png',
      'res/images/product.png',
      'res/images/product.png'
    ],
    productColor: [
      AppColors.productBlack,
      AppColors.productOrange,
      AppColors.productGrey,
    ],
    thumbUrl: 'res/images/product.png',
    name: '21WN ',
    title: 'reversible angora cardigan',
    price: 120,
    ratting: 10,
    size: ['s', 'm', 'l'],
  ),
  Product(
    imageSlider: [
      'res/images/product.png',
      'res/images/product.png',
      'res/images/product.png'
    ],
    productColor: [
      AppColors.productBlack,
      AppColors.productOrange,
      AppColors.productGrey,
    ],
    thumbUrl: 'res/images/product.png',
    name: '21WN ',
    title: 'reversible angora cardigan',
    price: 120,
    ratting: 10,
    size: ['s', 'm', 'l'],
  ),
  Product(
    imageSlider: [
      'res/images/product.png',
      'res/images/product.png',
      'res/images/product.png'
    ],
    productColor: [
      AppColors.productBlack,
      AppColors.productOrange,
      AppColors.productGrey,
    ],
    thumbUrl: 'res/images/product.png',
    name: '21WN ',
    title: 'reversible angora cardigan',
    price: 120,
    ratting: 10,
    size: ['s', 'm', 'l'],
  ),
  Product(
    imageSlider: [
      'res/images/product.png',
      'res/images/product.png',
      'res/images/product.png'
    ],
    productColor: [
      AppColors.productBlack,
      AppColors.productOrange,
      AppColors.productGrey,
    ],
    thumbUrl: 'res/images/product.png',
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
      appBar: CustomAppbar(),
      drawer: MenuDrawer(),
      endDrawer: SearchDrawer(),
      backgroundColor: AppColors.offWhite,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              CustomCauselSlider(urlImages),
              TabBarTypeItem(tabController: _tabController, items: listItem),
              CustomDivider(),
              CustomGridviewBrand(listBrand: brands),
              CustomDivider(),
              CustomCollection(),
              CustomJustForYou(items: listItem),
              TagTrending(tags: tags),
              FeaturesApp(features: features),
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
