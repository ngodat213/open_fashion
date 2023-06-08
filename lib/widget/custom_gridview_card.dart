import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:open_fashion/model/product.dart';
import 'package:open_fashion/screen/product_detail_screen/product_detail_screen.dart';
import 'package:open_fashion/theme/colors.dart';
import 'package:open_fashion/theme/dimens.dart';
import 'package:open_fashion/theme/txt_styles.dart';

class GridViewCard extends StatelessWidget {
  const GridViewCard({
    Key? key,
    required this.product,
  }) : super(key: key);
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
      child: Container(
        height: Dimens.HEIGHT_285,
        width: Dimens.WIDTH_165,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  product.thumbUrl!,
                  width: Dimens.WIDTH_165,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 6,
                  right: 9,
                  child: SvgPicture.asset(
                    'res/icons/favorite.svg',
                    color: AppColors.secondary,
                    width: Dimens.WIDTH_16,
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: Dimens.HEIGHT_8),
                  Text(
                    product.name!.toUpperCase(),
                    style: TxtStyle.font12(AppColors.titleActive),
                  ),
                  Text(product.title!, style: TxtStyle.font12(AppColors.label)),
                  SizedBox(height: Dimens.HEIGHT_4),
                  Text(
                    '\$${product.price}',
                    style: TxtStyle.font15(AppColors.secondary),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
