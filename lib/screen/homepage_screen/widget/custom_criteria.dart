import 'package:flutter/material.dart';
import 'package:open_fashion/theme/txt_styles.dart';
import 'package:open_fashion/theme/colors.dart';

class CustomCriteria extends StatelessWidget {
  const CustomCriteria(
    this.urlImage,
    this.title, {
    super.key,
  });
  final String urlImage;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset(urlImage),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TxtStyle.font12(AppColors.label),
          )
        ],
      ),
    );
  }
}
