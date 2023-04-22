import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_fashion/theme/colors.dart';
import 'package:open_fashion/theme/txt_styles.dart';
import 'package:open_fashion/theme/dimens.dart';

class GridViewCardFull extends StatelessWidget {
  const GridViewCardFull({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimens.HEIGHT_551,
      width: Dimens.WIDTH_343,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(
                'res/images/item_full.png',
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
          Text('21WN'.toUpperCase(),
              style: TxtStyle.font18(AppColors.titleActive)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Reversible Angora Cardigan',
                  style: TxtStyle.font16(AppColors.label)),
              Text('\$120', style: TxtStyle.font18(AppColors.secondary)),
            ],
          ),
        ],
      ),
    );
  }
}
