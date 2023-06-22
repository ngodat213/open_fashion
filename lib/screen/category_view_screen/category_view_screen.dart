import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:open_fashion/model/product.dart';
import 'package:open_fashion/screen/homepage_screen/homepage_screen.dart';
import 'package:open_fashion/theme/colors.dart';
import 'package:open_fashion/theme/txt_styles.dart';
import 'package:open_fashion/widget/appbar.dart';
import 'package:open_fashion/widget/custom_gridview_card.dart';
import 'package:open_fashion/widget/custom_gridview_card_full.dart';
import 'package:open_fashion/widget/custom_listview_card.dart';

import '../../widget/custom_tag_border.dart';

import 'package:flutter/services.dart' as rootBundle;

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView>
    with SingleTickerProviderStateMixin {
  List<Product> products = [];
  late List<Product> product = [];
  int numberOfProductsPerPage = 10;
  int isGrid = 0;
  int currentPage = 0;

  final List<String> types = [
    'Women',
    'All apparel',
  ];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    List<Product> productList = await getDataJson();
    setState(() {
      products = productList;
      product = productList.sublist(0, numberOfProductsPerPage);
    });
  }

  Future<List<Product>> getDataJson() async {
    final jsondata =
        await rootBundle.rootBundle.loadString('lib/json/product.json');

    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => Product.fromJson(e)).toList();
  }

  void onPageSelected(int page) {
    setState(() {
      print(page);
      currentPage = page;
      int startIndex = page * numberOfProductsPerPage;
      int endIndex = startIndex + numberOfProductsPerPage;
      if (startIndex < products.length) {
        if (endIndex > products.length) {
          endIndex = products.length;
        }
        product = products.sublist(startIndex, endIndex);
      } else {
        product = [];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final int numberOfPages =
        (products.length / numberOfProductsPerPage).ceil();
    return Scaffold(
      appBar: CustomAppbar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left: 16, right: 16),
            child: Column(
              children: [
                _statusBar(context),
                Row(
                  children: types
                      .map((e) => Container(
                          margin: EdgeInsets.only(right: 5),
                          child: TagBorder(title: e, isSearch: true)))
                      .toList(),
                ),
                SizedBox(height: 17),
                buildList(),
                NumberPaginator(
                  config: NumberPaginatorUIConfig(
                      buttonSelectedBackgroundColor: AppColors.body,
                      buttonSelectedForegroundColor: AppColors.offWhite,
                      buttonUnselectedBackgroundColor:
                          AppColors.placeholder.withOpacity(0.1),
                      buttonUnselectedForegroundColor: AppColors.label,
                      buttonShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero)),
                  numberPages: numberOfPages,
                  onPageChange: onPageSelected,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _statusBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('${products.length} APPAREL',
            style: TxtStyle.font14(AppColors.titleActive)),
        Row(
          children: [
            _customButtonCircle(
              iconPath: isGrid == 0
                  ? 'res/icons/Listview.svg'
                  : isGrid == 1
                      ? 'res/icons/Gallery.svg'
                      : 'res/icons/grid view.svg',
              onTap: () {
                setState(() {
                  if (isGrid == 2) {
                    isGrid = 0;
                    numberOfProductsPerPage = 5;
                  } else {
                    isGrid++;
                  }
                });
              },
            ),
            _customButtonCircle(
              iconPath: 'res/icons/Filter.svg',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const HomepageScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget buildList() => isGrid == 0
      ? GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 12,
            mainAxisExtent: 280,
          ),
          itemCount: product.length,
          itemBuilder: (context, index) {
            return GridViewCard(product: product[index]);
          },
        )
      : isGrid == 1
          ? Column(
              children: product.map((e) => ListViewCard(product: e)).toList(),
            )
          : Column(
              children:
                  product.map((e) => GridViewCardFull(product: e)).toList(),
            );
}

class _customButtonCircle extends StatelessWidget {
  const _customButtonCircle({
    required this.iconPath,
    required this.onTap,
  });
  final String iconPath;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap.call();
      },
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: AppColors.footer.withOpacity(0.1),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: Container(
            width: 20,
            height: 20,
            child: SvgPicture.asset(iconPath),
          ),
        ),
      ),
    );
  }
}
