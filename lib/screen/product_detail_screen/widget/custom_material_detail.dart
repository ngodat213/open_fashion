import 'package:flutter/material.dart';

import '../../../theme/colors.dart';
import '../../../theme/txt_styles.dart';
import '../../../widget/custom_text_icon.dart';

class CustomMaterialDetail extends StatelessWidget {
  const CustomMaterialDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'MATERIALS',
            style: TxtStyle.font14(AppColors.titleActive),
          ),
          SizedBox(height: 6),
          Text(
            'We work with monitoring programmes to ensure compliance with safety, health and quality standards for our products.',
            style: TxtStyle.font14(AppColors.label),
          ),
          SizedBox(height: 18),
          Text(
            'CARE',
            style: TxtStyle.font14(AppColors.titleActive),
          ),
          SizedBox(height: 6),
          Text(
            'To keep your jackets and coats clean, you only need to freshen them up and go over them with a cloth or a clothes brush. If you need to dry clean a garment, look for a dry cleaner that uses technologies that are respectful of the environment.',
            style: TxtStyle.font14(AppColors.label),
          ),
          SizedBox(height: 13),
          CustomTextIcon(
            'Do not use bleach',
            prefix: 'res/icons/do_not_bleach.svg',
            colorIcon: AppColors.label,
            style: TxtStyle.font14(AppColors.label),
          ),
          CustomTextIcon(
            'Do not tumble dry',
            prefix: 'res/icons/do_not_tumble_dry.svg',
            colorIcon: AppColors.label,
            style: TxtStyle.font14(AppColors.label),
          ),
          CustomTextIcon(
            'Dry clean with tetrachloroethylene',
            prefix: 'res/icons/do_not_wash.svg',
            colorIcon: AppColors.label,
            style: TxtStyle.font14(AppColors.label),
          ),
          CustomTextIcon(
            'Iron at a maximum of 110ºC/230ºF',
            prefix: 'res/icons/iron_low_temperature.svg',
            colorIcon: AppColors.label,
            style: TxtStyle.font14(AppColors.label),
          ),
        ],
      ),
    );
  }
}
