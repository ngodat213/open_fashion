import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:open_fashion/model/product.dart';
import 'package:open_fashion/theme/colors.dart';
import 'package:open_fashion/theme/images.dart';
import 'package:open_fashion/theme/txt_styles.dart';
import 'package:open_fashion/widget/appbar.dart';
import 'package:open_fashion/widget/base_text.dart';
import 'package:open_fashion/widget/custom_size_button.dart';

import '../../widget/custom_button_add2basket.dart';
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
      Images.imageProduct,
      Images.imageProduct,
      Images.imageProduct,
    ],
    productColor: [
      AppColors.productBlack,
      AppColors.productOrange,
      AppColors.productGrey,
    ],
    thumbUrl: Images.imageProduct,
    name: '21WN',
    title: 'Reversible Angora Cardigan',
    price: 120,
    rating: 4,
    size: ['s', 'm', 'l'],
  ),
  new Product(
    imageSlider: [
      Images.imageProduct,
      Images.imageProduct,
      Images.imageProduct
    ],
    productColor: [
      AppColors.productBlack,
      AppColors.productOrange,
      AppColors.productGrey,
    ],
    thumbUrl: Images.imageProduct,
    name: '21WN',
    title: 'Reversible Angora Cardigan',
    price: 120,
    rating: 4,
    size: ['s', 'm', 'l'],
  ),
  new Product(
    imageSlider: [
      Images.imageProduct,
      Images.imageProduct,
      Images.imageProduct
    ],
    productColor: [
      AppColors.productBlack,
      AppColors.productOrange,
      AppColors.productGrey,
    ],
    thumbUrl: Images.imageProduct,
    name: '21WN',
    title: 'Reversible Angora Cardigan',
    price: 120,
    rating: 4,
    size: ['s', 'm', 'l'],
  ),
  new Product(
    imageSlider: [
      Images.imageProduct,
      Images.imageProduct,
      Images.imageProduct
    ],
    productColor: [
      AppColors.productBlack,
      AppColors.productOrange,
      AppColors.productGrey,
    ],
    thumbUrl: Images.imageProduct,
    name: '21WN',
    title: 'Reversible Angora Cardigan',
    price: 120,
    rating: 4,
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
                itemCount: widget.product.imageSlider?.length,
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
                              image: AssetImage(
                                  widget.product.imageSlider![index]),
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
                    widget.product.imageSlider!.length,
                    (i) => Container(
                          margin: EdgeInsets.only(left: 5),
                          child: SvgPicture.asset(
                            pageNo != i
                                ? Images.iconDiamondUnselect
                                : Images.iconDiamondSelect,
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
                          widget.product.name!.toUpperCase(),
                          style: TxtStyle.font16(AppColors.titleActive),
                        ),
                        SvgPicture.asset(
                          Images.iconExport,
                          width: 16,
                          height: 16,
                        )
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      widget.product.title!,
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
                        _selectColor(),
                        _selectSize(),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 33),
              AddToBesket(),
              CustomMaterialDetail(),
              Container(
                margin: EdgeInsets.only(left: 20, top: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Care'.toUpperCase(),
                      style: TxtStyle.font14(AppColors.titleActive),
                    ),
                    _customExpansionTile(
                      'Free Flat Rate Shipping',
                      prefix: Images.iconShipping,
                      description:
                          'Estimated to be delivered on 09/11/2021 - 12/11/2021.',
                    ),
                    _customExpansionTile(
                      'COD Policy',
                      prefix: Images.iconTag,
                      description: 'COD Policy',
                    ),
                    _customExpansionTile(
                      'Return Policy',
                      prefix: Images.iconRefresh,
                      description: 'COD Policy',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 70),
              ProductRecommend(products: products),
            ],
          ),
        ),
      ),
    );
  }

  Row _selectSize() {
    return Row(
      children: [
        Text(
          'Size',
          style: TxtStyle.font12(AppColors.titleActive),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              widget.product.size!.length,
              (i) => InkWell(
                    onTap: () {
                      chooseSize = i;
                      setState(() {});
                    },
                    child: ButtonSize(
                      size: widget.product.size![i],
                      isChoose: chooseSize == i ? true : false,
                    ),
                  )).toList(),
        ),
      ],
    );
  }

  Row _selectColor() {
    return Row(
      children: [
        Text(
          'Color ',
          style: TxtStyle.font12(AppColors.titleActive),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              widget.product.productColor!.length,
              (i) => InkWell(
                    onTap: () {
                      chooseColor = i;
                      setState(() {});
                    },
                    child: CustomChooseColor(
                      color: widget.product.productColor![i],
                      isChoose: chooseColor == i ? true : false,
                    ),
                  )).toList(),
        ),
      ],
    );
  }
}

class _customExpansionTile extends StatelessWidget {
  const _customExpansionTile(
    this.title, {
    required this.prefix,
    required this.description,
  });
  final String? prefix;
  final String? title;
  final String? description;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: EdgeInsets.only(left: 0, right: 20),
      title: Row(
        children: [
          SvgPicture.asset(
            prefix ?? '',
            width: 24,
          ),
          SizedBox(width: 10),
          BaseText(
            title,
            style: TxtStyle.font14(AppColors.body),
          ),
        ],
      ),
      expandedAlignment: Alignment.topLeft,
      children: [
        Container(
          width: 260,
          height: 50,
          margin: EdgeInsets.only(left: 34),
          alignment: Alignment.topLeft,
          child: BaseText(
            description,
            style: TxtStyle.font14(AppColors.body),
          ),
        )
      ],
    );
  }
}
