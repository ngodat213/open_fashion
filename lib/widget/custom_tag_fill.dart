import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open_fashion/theme/colors.dart';
import 'package:open_fashion/theme/txt_styles.dart';

class TagFill extends StatelessWidget {
  const TagFill({
    Key? key,
    required this.title,
    this.color,
    this.suffix,
    this.onPressed,
  }) : super(key: key);
  final String title;
  final Function? onPressed;
  final Color? color;
  final SvgPicture? suffix;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color ?? AppColors.inputBackground,
          borderRadius: BorderRadius.circular(30)),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: TxtStyle.font14(AppColors.body)),
          GestureDetector(
              onTap: () {
                onPressed?.call();
              },
              child: suffix ?? Container())
        ],
      ),
    );
  }
}
