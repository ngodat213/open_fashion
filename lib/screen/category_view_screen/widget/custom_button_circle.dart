import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../theme/colors.dart';

class CustomButtonCircle extends StatelessWidget {
  const CustomButtonCircle({
    super.key,
    required this.iconPath,
    required this.onTap,
  });
  final String iconPath;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap.call();
      },
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: AppColors.footer.withOpacity(0.1),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: Container(
            width: 20,
            height: 20,
            child: SvgPicture.asset(iconPath),
          ),
        ),
      ),
    );
  }
}
