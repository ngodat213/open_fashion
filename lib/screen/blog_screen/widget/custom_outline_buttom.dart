import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../theme/colors.dart';
import '../../../theme/txt_styles.dart';

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      child: Container(
        width: 211,
        height: 48,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'LOAD MORE',
              style: TxtStyle.font16(AppColors.titleActive),
            ),
            SizedBox(width: 16),
            SvgPicture.asset(
              'res/icons/plus.svg',
              color: AppColors.titleActive,
            )
          ],
        ),
      ),
    );
  }
}
