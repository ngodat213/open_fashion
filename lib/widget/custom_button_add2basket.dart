import 'package:flutter/material.dart';
import 'package:open_fashion/generated/l10n.dart';
import 'package:open_fashion/theme/dimens.dart';
import 'package:open_fashion/theme/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_fashion/theme/images.dart';
import 'package:open_fashion/theme/txt_styles.dart';

class AddToBesket extends StatelessWidget {
  const AddToBesket({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimens.HEIGHT_56,
      color: AppColors.titleActive,
      padding: EdgeInsets.fromLTRB(16, 17, 24, 17),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _addToBasket(),
          _addToFavorite(),
        ],
      ),
    );
  }
}

class _addToFavorite extends StatelessWidget {
  const _addToFavorite();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SvgPicture.asset(
        Images.iconHeart,
        color: AppColors.inputBackground,
      ),
    );
  }
}

class _addToBasket extends StatelessWidget {
  const _addToBasket();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        children: [
          SvgPicture.asset(
            Images.iconPlus,
            color: AppColors.inputBackground,
          ),
          SizedBox(width: 8),
          Text(
            S.of(context).addToBasket,
            style: TxtStyle.font14(AppColors.offWhite),
          )
        ],
      ),
    );
  }
}
