import 'package:flutter/material.dart';

import '../../../model/product.dart';
import '../../../theme/colors.dart';
import '../../../theme/txt_styles.dart';
import '../../product_detail_screen/product_detail_screen.dart';
import 'custom_divider.dart';

class CustomJustForYou extends StatelessWidget {
  const CustomJustForYou({
    super.key,
    required this.items,
  });

  final List<Product> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 70),
        Text(
          'Just for You'.toUpperCase(),
          style: TxtStyle.font18(AppColors.titleActive),
        ),
        CustomDivider(),
        SizedBox(height: 23),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: items
                .map((e) => Builder(builder: (context) {
                      return Column(
                        children: [
                          CustomJustForYouProduct(product: e),
                        ],
                      );
                    }))
                .toList(),
          ),
        ),
      ],
    );
  }
}

class CustomJustForYouProduct extends StatelessWidget {
  const CustomJustForYouProduct({
    super.key,
    required this.product,
  });
  final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(product: product),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(left: 10),
        child: Container(
          width: 255,
          height: 390,
          child: Column(
            children: [
              Image.asset(
                product.thumbUrl!,
                width: 255,
                height: 310,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 4),
              Text(
                product.title!,
                textAlign: TextAlign.center,
                style: TxtStyle.font16(AppColors.body),
              ),
              Text(
                '\$${product.price}',
                style: TxtStyle.font16(AppColors.primary),
              )
            ],
          ),
        ),
      ),
    );
  }
}
