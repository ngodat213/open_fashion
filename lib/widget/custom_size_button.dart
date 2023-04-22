import 'package:flutter/material.dart';
import 'package:open_fashion/theme/colors.dart';
import 'package:open_fashion/theme/dimens.dart';

class ButtonSize extends StatelessWidget {
  const ButtonSize({super.key, required this.size});
  final String size;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimens.WIDTH_24,
      height: Dimens.HEIGHT_24,
      margin: EdgeInsets.only(left: Dimens.PADDING_6),
      decoration: BoxDecoration(
          border: Border.all(width: Dimens.WIDTH_1, color: AppColors.border),
          borderRadius: BorderRadius.circular(Dimens.RADIUS_100)),
      child: Center(child: Text(size)),
    );
  }
}
