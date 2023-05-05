import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_fashion/theme/colors.dart';
import 'package:open_fashion/theme/txt_styles.dart';
import 'package:open_fashion/theme/dimens.dart';

class HomefullCard extends StatelessWidget {
  const HomefullCard(
      {required this.thumbUrl,
      required this.name,
      required this.title,
      required this.price,
      required this.ratting,
      required this.size,
      this.favorite,
      super.key});

  final String thumbUrl;
  final String name;
  final String title;
  final double price;
  final double ratting;
  final List<String> size;
  final bool? favorite;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimens.WIDTH_165,
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                thumbUrl,
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
                  child: Text('${name.toUpperCase()} $title',
                      textAlign: TextAlign.center,
                      style: TxtStyle.font12(AppColors.titleActive)),
                ),
                SizedBox(height: Dimens.HEIGHT_4),
                Text('\$$price', style: TxtStyle.font15(AppColors.secondary)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
