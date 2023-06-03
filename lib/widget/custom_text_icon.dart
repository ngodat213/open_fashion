import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open_fashion/theme/colors.dart';

class CustomTextIcon extends StatelessWidget {
  const CustomTextIcon({
    super.key,
    this.prefix = "",
    this.suffix = "",
    this.colorIcon = AppColors.titleActive,
    this.size = 24,
    required this.text,
    required this.style,
  });
  final Color? colorIcon;
  final String text;
  final String? prefix;
  final String? suffix;
  final double? size;
  final TextStyle style;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(prefix!,
              width: size, height: size, color: colorIcon),
          SizedBox(width: 13),
          Text(
            text,
            style: style,
          ),
          SizedBox(width: 13),
          SvgPicture.asset(
            suffix!,
            width: size,
            height: size,
            color: colorIcon,
          )
        ],
      ),
    );
  }
}
