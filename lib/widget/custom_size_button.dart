import 'package:flutter/material.dart';
import 'package:open_fashion/theme/colors.dart';
import 'package:open_fashion/theme/dimens.dart';
import 'package:open_fashion/theme/txt_styles.dart';

class ButtonSize extends StatelessWidget {
  const ButtonSize({
    super.key,
    required this.size,
    this.isChoose = false,
  });
  final String size;
  final bool? isChoose;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimens.WIDTH_24,
      height: Dimens.HEIGHT_24,
      margin: EdgeInsets.only(left: Dimens.PADDING_6),
      decoration: BoxDecoration(
          color:
              isChoose == true ? AppColors.titleActive : AppColors.background,
          border: Border.all(
            width: isChoose == true ? Dimens.WIDTH_1 : 0,
            color: isChoose == true ? AppColors.titleActive : AppColors.border,
          ),
          borderRadius: BorderRadius.circular(Dimens.RADIUS_100)),
      child: Center(
        child: Text(
          size.toUpperCase(),
          style: TxtStyle.font10(
            isChoose == true ? AppColors.background : AppColors.label,
          ),
        ),
      ),
    );
  }
}
