import 'package:flutter/material.dart';
import 'package:open_fashion/theme/colors.dart';
import 'package:open_fashion/theme/txt_styles.dart';

class TagFill extends StatelessWidget {
  const TagFill({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.inputBackground,
          borderRadius: BorderRadius.circular(30)),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Text(title, style: TxtStyle.font14(AppColors.body)),
    );
  }
}
