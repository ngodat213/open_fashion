import 'package:flutter/material.dart';
import 'package:open_fashion/theme/images.dart';

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
      Images.imageMs1,
      'Fast shipping. Free on orders over \$25.',
    ),
    new Features(
      Images.imageMs2,
      'Sustainable process from start to finish.',
    ),
    new Features(
      Images.imageMs3,
      'Unique designs and high-quality materials.',
    ),
    new Features(
      Images.imageMs4,
      'Fast shipping. Free on orders over \$25.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 64),
        Image.asset(Images.imageLogo),
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
        Image.asset(Images.imageEnd)
      ],
    );
  }
}
