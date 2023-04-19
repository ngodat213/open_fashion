import 'package:flutter/material.dart';
import 'package:open_fashion/theme/dimens.dart';
import 'package:open_fashion/theme/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
          Row(
            children: [
              SvgPicture.asset('res/icons/plus.svg',
                  color: AppColors.inputBackground, width: 20, height: 20),
              SizedBox(width: 8),
              Text(
                'ADD TO BASKET',
                style: TxtStyle.font14(AppColors.offWhite),
              )
            ],
          ),
          SvgPicture.asset("res/icons/heart.svg",
              color: AppColors.inputBackground, width: 24, height: 24),
        ],
      ),
    );
  }
}
