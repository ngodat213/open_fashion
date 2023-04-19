import 'package:flutter/material.dart';
import 'package:open_fashion/theme/colors.dart';
import 'package:open_fashion/theme/txt_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TagBorder extends StatelessWidget {
  const TagBorder({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.border, width: 1),
          borderRadius: BorderRadius.circular(30)),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title, style: TxtStyle.font14(AppColors.body)),
          SvgPicture.asset('res/icons/close.svg', width: 16, height: 16)
        ],
      ),
    );
  }
}
