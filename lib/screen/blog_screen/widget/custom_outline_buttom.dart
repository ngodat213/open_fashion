import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../theme/colors.dart';
import '../../../theme/txt_styles.dart';

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton({
    super.key,
    required this.text,
    required this.onPressed,
  });
  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        onPressed.call();
      },
      child: Container(
        width: 211,
        height: 48,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text.toUpperCase(),
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
