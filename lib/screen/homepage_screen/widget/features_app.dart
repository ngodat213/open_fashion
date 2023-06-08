import 'package:flutter/material.dart';

import '../../../model/features.dart';
import '../../../theme/colors.dart';
import '../../../theme/txt_styles.dart';
import 'custom_criteria.dart';
import 'custom_divider.dart';

class FeaturesApp extends StatelessWidget {
  FeaturesApp({
    super.key,
  });

  final List<Features> features = [
    new Features(
      'res/images/ms1.png',
      'Fast shipping. Free on orders over \$25.',
    ),
    new Features(
      'res/images/ms2.png',
      'Sustainable process from start to finish.',
    ),
    new Features(
      'res/images/ms3.png',
      'Unique designs and high-quality materials.',
    ),
    new Features(
      'res/images/ms4.png',
      'Fast shipping. Free on orders over \$25.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 64),
        Image.asset('res/images/logo.png'),
        Container(
          margin: EdgeInsets.only(top: 16),
          width: 280,
          child: Text(
            'Making a luxurious lifestyle accessible for a generous group of women is our daily drive.',
            textAlign: TextAlign.center,
            style: TxtStyle.font14(AppColors.titleActive),
          ),
        ),
        CustomDivider(),
        SizedBox(height: 25),
        GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 13,
            mainAxisSpacing: 11,
            mainAxisExtent: 68,
          ),
          itemCount: features.length,
          itemBuilder: (context, index) {
            return CustomCriteria(
              features[index].imagePath,
              features[index].title,
            );
          },
        ),
        SizedBox(height: 33),
        Image.asset('res/images/end.png')
      ],
    );
  }
}
