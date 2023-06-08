import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_fashion/theme/colors.dart';
import 'package:open_fashion/theme/txt_styles.dart';
import 'package:open_fashion/theme/dimens.dart';

import '../model/product.dart';
import '../screen/product_detail_screen/product_detail_screen.dart';

class HomefullCard extends StatelessWidget {
  const HomefullCard({required this.product, this.favorite, super.key});
  final Product product;
  final bool? favorite;

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
        width: Dimens.WIDTH_165,
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  product.thumbUrl!,
                  width: Dimens.WIDTH_165,
                  height: Dimens.HEIGHT_200,
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
            Expanded(
              child: Column(
                children: [
                  SizedBox(height: Dimens.HEIGHT_8),
                  SizedBox(
                    width: Dimens.WIDTH_165,
                    child: Text(
                        '${product.name!.toUpperCase()} ${product.title}',
                        textAlign: TextAlign.center,
                        style: TxtStyle.font12(AppColors.titleActive)),
                  ),
                  SizedBox(height: Dimens.HEIGHT_4),
                  Text('\$${product.price}',
                      style: TxtStyle.font15(AppColors.secondary)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
