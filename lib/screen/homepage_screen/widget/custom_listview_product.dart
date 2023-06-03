import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../model/product.dart';
import '../../../theme/colors.dart';
import '../../../theme/txt_styles.dart';
import 'custom_divider.dart';

class CustomJustForYou extends StatelessWidget {
  const CustomJustForYou({
    super.key,
    required this.items,
  });

  final List<Product> items;

  @override
  Widget build(BuildContext context) {
    final len = items.length;
    return Column(
      children: [
        SizedBox(height: 70),
        Text(
          'Just for You'.toUpperCase(),
          style: TxtStyle.font18(AppColors.titleActive),
        ),
        CustomDivider(),
        SizedBox(height: 23),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: items
                .map((e) => Builder(builder: (context) {
                      return Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Container(
                              width: 255,
                              height: 390,
                              child: Column(
                                children: [
                                  Image.asset(
                                    e.thumbUrl,
                                    width: 255,
                                    height: 310,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'Harris Tweed Three button Jacket',
                                    textAlign: TextAlign.center,
                                    style: TxtStyle.font16(AppColors.body),
                                  ),
                                  Text(
                                    '\$120',
                                    style: TxtStyle.font16(AppColors.primary),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                                len,
                                (i) => Container(
                                      margin: EdgeInsets.only(left: 5),
                                      child: SvgPicture.asset(
                                        'res/icons/diamond-solid.svg',
                                        width: 8,
                                        color: e != i
                                            ? AppColors.background
                                            : AppColors.placeholder,
                                      ),
                                    )).toList(),
                          ),
                        ],
                      );
                    }))
                .toList(),
          ),
        ),
      ],
    );
  }
}
