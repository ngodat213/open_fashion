import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_fashion/theme/colors.dart';
import 'package:open_fashion/theme/txt_styles.dart';
import 'package:open_fashion/theme/dimens.dart';

class GridViewCard extends StatelessWidget {
  const GridViewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimens.HEIGHT_285,
      width: Dimens.WIDTH_165,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(
                'res/images/item.png',
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
                Text('21WN'.toUpperCase(),
                    style: TxtStyle.font12(AppColors.titleActive)),
                Text('reversible angora cardigan',
                    style: TxtStyle.font12(AppColors.label)),
                SizedBox(height: Dimens.HEIGHT_4),
                Text('\$120', style: TxtStyle.font15(AppColors.secondary)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
