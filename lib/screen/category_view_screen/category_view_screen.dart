import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open_fashion/model/product.dart';
import 'package:open_fashion/screen/homepage_screen/homepage_screen.dart';
import 'package:open_fashion/theme/colors.dart';
import 'package:open_fashion/theme/txt_styles.dart';
import 'package:open_fashion/widget/appbar.dart';
import 'package:open_fashion/widget/custom_gridview_card.dart';
import 'package:open_fashion/widget/custom_listview_card.dart';
import 'package:open_fashion/widget/footer.dart';

import '../../widget/custom_tag_border.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  //

  bool isGrid = true;
  final List<String> types = [
    'Women',
    'All apparel',
  ];

  final List<Product> products = [
    new Product(
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
      name: '21WN',
      title: 'Reversible Angora Cardigan',
      price: 120,
      ratting: 4.8,
      size: ['s', 'm', 'l'],
    ),
    new Product(
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
      name: '21WN',
      title: 'Reversible Angora Cardigan',
      price: 120,
      ratting: 4.8,
      size: ['s', 'm', 'l'],
    ),
    new Product(
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
      name: '21WN',
      title: 'Reversible Angora Cardigan',
      price: 120,
      ratting: 4.8,
      size: ['s', 'm', 'l'],
    ),
    new Product(
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
      name: '21WN',
      title: 'Reversible Angora Cardigan',
      price: 120,
      ratting: 4.8,
      size: ['s', 'm', 'l'],
    )
  ];

  @override
  Widget build(BuildContext context) {
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
                FooterWidget(),
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
        Text('4500 APPAREL', style: TxtStyle.font14(AppColors.titleActive)),
        Row(
          children: [
            CustomButtonCircle(
              iconPath: isGrid == true
                  ? 'res/icons/Listview.svg'
                  : 'res/icons/grid view.svg',
              onTap: () {
                setState(() {
                  isGrid = !isGrid;
                });
              },
            ),
            CustomButtonCircle(
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

  Widget buildList() => isGrid
      ? GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 12,
            mainAxisExtent: 280,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return GridViewCard(product: products[index]);
          },
        )
      : Column(
          children: products.map((e) => ListViewCard(product: e)).toList(),
        );
}

class CustomButtonCircle extends StatelessWidget {
  const CustomButtonCircle({
    super.key,
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
