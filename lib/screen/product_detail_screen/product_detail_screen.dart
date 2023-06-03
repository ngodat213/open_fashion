// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:open_fashion/model/product.dart';
import 'package:open_fashion/screen/homepage_screen/widget/custom_divider.dart';
import 'package:open_fashion/theme/colors.dart';
import 'package:open_fashion/theme/txt_styles.dart';
import 'package:open_fashion/widget/appbar.dart';
import 'package:open_fashion/widget/custom_size_button.dart';
import 'package:open_fashion/widget/footer.dart';

import '../../widget/custom_button_add2basket.dart';
import '../../widget/custom_gridview_card.dart';
import 'widget/custom_choose_color.dart';
import 'widget/custom_material_detail.dart';
import 'widget/product_recommend.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({
    super.key,
    required this.product,
  });
  final Product product;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

int pageNo = 0;
int chooseColor = 0;
int chooseSize = 0;

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

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              CarouselSlider.builder(
                itemCount: widget.product.imageSlider.length,
                options: CarouselOptions(
                  height: 600,
                  viewportFraction: 1,
                  autoPlay: true,
                  reverse: false,
                  onPageChanged: (index, reason) {
                    pageNo = index;
                    setState(() {});
                  },
                ),
                itemBuilder: (context, index, realIndex) {
                  return Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 15, bottom: 15),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage(widget.product.imageSlider[index]),
                              fit: BoxFit.fitHeight),
                        ),
                      ),
                    ],
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    widget.product.imageSlider.length,
                    (i) => Container(
                          margin: EdgeInsets.only(left: 5),
                          child: SvgPicture.asset(
                            pageNo != i
                                ? 'res/icons/diamond-unselect.svg'
                                : 'res/icons/diamond-select.svg',
                            width: 8,
                          ),
                        )).toList(),
              ),
              Container(
                margin: EdgeInsets.only(left: 16, top: 30, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.product.name.toUpperCase(),
                          style: TxtStyle.font16(AppColors.titleActive),
                        ),
                        SvgPicture.asset(
                          'res/icons/Export.svg',
                          width: 16,
                          height: 16,
                        )
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      widget.product.title,
                      style: TxtStyle.font16(AppColors.titleActive),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '\$${widget.product.price}',
                      style: TxtStyle.font16(AppColors.secondary),
                    ),
                    SizedBox(height: 18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        selectColor(),
                        selectSize(),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 33),
              AddToBesket(),
              CustomMaterialDetail(),
              SizedBox(height: 70),
              ProductRecommend(products: products),
              FooterWidget()
            ],
          ),
        ),
      ),
    );
  }

  Row selectSize() {
    return Row(
      children: [
        Text(
          'Size',
          style: TxtStyle.font12(AppColors.titleActive),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              widget.product.size.length,
              (i) => InkWell(
                    onTap: () {
                      chooseSize = i;
                      setState(() {});
                    },
                    child: ButtonSize(
                      size: widget.product.size[i],
                      isChoose: chooseSize == i ? true : false,
                    ),
                  )).toList(),
        ),
      ],
    );
  }

  Row selectColor() {
    return Row(
      children: [
        Text(
          'Color ',
          style: TxtStyle.font12(AppColors.titleActive),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              widget.product.productColor.length,
              (i) => InkWell(
                    onTap: () {
                      chooseColor = i;
                      setState(() {});
                    },
                    child: CustomChooseColor(
                      color: widget.product.productColor[i],
                      isChoose: chooseColor == i ? true : false,
                    ),
                  )).toList(),
        ),
      ],
    );
  }
}
