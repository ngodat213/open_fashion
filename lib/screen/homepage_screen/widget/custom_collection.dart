import 'package:flutter/material.dart';
import 'package:open_fashion/theme/images.dart';
import 'package:open_fashion/theme/txt_styles.dart';
import 'package:open_fashion/theme/dimens.dart';
import 'package:open_fashion/theme/colors.dart';

class CustomCollection extends StatelessWidget {
  const CustomCollection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Dimens.PADDING_47),
      child: Column(
        children: [
          Text(
            'Collections'.toUpperCase(),
            style: TxtStyle.font18(AppColors.titleActive),
          ),
          SizedBox(height: Dimens.HEIGHT_35),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 240,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(Images.imageFrame2),
              ),
            ),
          ),
          Container(
            width: 260,
            height: 296,
            margin: EdgeInsets.only(top: 40),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(Images.imageFrame2),
              ),
            ),
          ),

          // VIDEO
        ],
      ),
    );
  }
}
