import 'package:flutter/material.dart';
import 'package:open_fashion/theme/dimens.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimens.HEIGHT_60,
      margin: EdgeInsets.fromLTRB(16, 20, 23, 9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset("res/icons/menu.svg"),
          Image.asset("res/images/logo.png"),
          SizedBox(
            child: Row(
              children: [
                SvgPicture.asset("res/icons/search.svg"),
                SizedBox(width: Dimens.HEIGHT_12),
                SvgPicture.asset("res/icons/shopping_bag.svg")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
