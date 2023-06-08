import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_fashion/model/product.dart';
import 'package:open_fashion/theme/colors.dart';
import 'package:open_fashion/theme/txt_styles.dart';
import 'package:open_fashion/theme/dimens.dart';

class GridViewCardFull extends StatelessWidget {
  const GridViewCardFull({
    super.key,
    required this.product,
  });
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimens.HEIGHT_511,
      width: Dimens.WIDTH_343,
      margin: EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(
                product.imageSlider![0],
                width: Dimens.WIDTH_343,
                height: Dimens.HEIGHT_457,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 13,
                right: 15,
                child: SvgPicture.asset(
                  'res/icons/favorite.svg',
                  color: AppColors.secondary,
                  width: Dimens.WIDTH_16,
                ),
              )
            ],
          ),
          Text(product.name!.toUpperCase(),
              style: TxtStyle.font18(AppColors.titleActive)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(product.title!, style: TxtStyle.font16(AppColors.label)),
              Text('\$${product.price}',
                  style: TxtStyle.font18(AppColors.secondary)),
            ],
          ),
        ],
      ),
    );
  }
}
