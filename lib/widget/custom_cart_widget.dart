import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_fashion/theme/colors.dart';
import 'package:open_fashion/theme/txt_styles.dart';
import 'package:open_fashion/theme/dimens.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimens.HEIGHT_134,
      child: Row(children: [
        Container(
          height: Dimens.HEIGHT_133,
          width: Dimens.WIDTH_100,
          margin: EdgeInsets.only(right: 11),
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('res/images/item.png'))),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 7),
            Text('lamerei'.toUpperCase(),
                style: TxtStyle.font14(AppColors.titleActive)),
            SizedBox(height: 6),
            Text(
              'Recycle Boucle Knit Cardigan Pink',
              style: TxtStyle.font12(AppColors.titleActive),
            ),
            SizedBox(height: 12),
            Container(
              width: 78,
              height: 24,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: Dimens.WIDTH_24,
                    height: Dimens.HEIGHT_24,
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.footer),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: SvgPicture.asset('res/icons/minus.svg', width: 16),
                  ),
                  Text('1', style: TxtStyle.font14(AppColors.titleActive)),
                  Container(
                    width: Dimens.WIDTH_24,
                    height: Dimens.HEIGHT_24,
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.footer),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: SvgPicture.asset('res/icons/plus.svg',
                        color: AppColors.inputBackground,
                        width: 20,
                        height: 20),
                  )
                ],
              ),
            ),
            SizedBox(height: Dimens.HEIGHT_12),
            Text('\$120', style: TxtStyle.font14(AppColors.secondary))
          ],
        )
      ]),
    );
  }
}
