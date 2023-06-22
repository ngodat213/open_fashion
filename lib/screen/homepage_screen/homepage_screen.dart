import 'dart:convert';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:open_fashion/theme/colors.dart';
import 'package:open_fashion/theme/images.dart';
import 'package:open_fashion/widget/appbar.dart';

import 'package:open_fashion/screen/homepage_screen/widget/custom_divider.dart';
import 'package:open_fashion/screen/homepage_screen/widget/custom_collection.dart';
import 'package:open_fashion/screen/homepage_screen/widget/custom_gridview_ig.dart';
import 'package:open_fashion/screen/homepage_screen/widget/custom_causel_slider.dart';
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
  Images.imageImageSlider,
  Images.imageImageSlider,
  Images.imageImageSlider,
  Images.imageImageSlider,
];

final brands = [
  Images.imageCatier,
  Images.imageCatier,
  Images.imageCatier,
  Images.imageCatier,
  Images.imageCatier,
  Images.imageCatier,
];

final listIg = [
  Instagram(imageUrl: Images.imageInstargramDefault, username: 'mia'),
  Instagram(imageUrl: Images.imageInstargramDefault, username: 'mia'),
  Instagram(imageUrl: Images.imageInstargramDefault, username: 'mia'),
  Instagram(imageUrl: Images.imageInstargramDefault, username: 'mia'),
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

  Future<List> loadBrand() async {
    List<Map> files = [];
    final ListResult result = await storageRef.listAll();
    final List<Reference> allFile = result.items;
    await Future.forEach(allFile, (Reference file) async {
      final String fileUrl = await file.getDownloadURL();
      files.add({
        "url": fileUrl,
        "path": file.fullPath,
      });
    });
    print(files);
    return files;
  }

  List<Product> listItems = [];
  final storageRef = FirebaseStorage.instance.ref().child('imageBrand');

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
              FutureBuilder(
                future: loadBrand(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 13,
                      mainAxisSpacing: 11,
                      mainAxisExtent: 30,
                    ),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final Map image = snapshot.data![index];
                      return Container(
                        child: Image.network(image['url']),
                      );
                    },
                  );
                },
              ),
              CustomDivider(),
              CustomCollection(),
              CustomJustForYou(items: listItems),
              TagTrending(tags: tags),
              FeaturesApp(),
              SizedBox(height: 35),
              CustomGridviewIg(listIg: listIg),
              const SizedBox(height: 56)
            ],
          ),
        ),
      ),
    );
  }
}
