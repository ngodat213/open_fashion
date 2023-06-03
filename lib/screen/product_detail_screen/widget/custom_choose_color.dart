import 'package:flutter/material.dart';
import 'package:open_fashion/theme/colors.dart';

import '../../../theme/dimens.dart';

class CustomChooseColor extends StatelessWidget {
  const CustomChooseColor({
    Key? key,
    this.isChoose = false,
    required this.color,
  }) : super(key: key);

  final bool? isChoose;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 22,
      height: 22,
      margin: EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
          border: Border.all(
              width: isChoose == true ? 1 : 0,
              color: isChoose == true
                  ? AppColors.titleActive
                  : AppColors.background),
          borderRadius: BorderRadius.circular(Dimens.RADIUS_100)),
      child: Center(
        child: Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(Dimens.RADIUS_100)),
        ),
      ),
    );
  }
}
