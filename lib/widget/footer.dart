import 'package:flutter/material.dart';
import 'package:open_fashion/theme/dimens.dart';
import 'package:open_fashion/theme/colors.dart';
import 'package:open_fashion/theme/txt_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset('res/icons/twitter.svg'),
              SvgPicture.asset('res/icons/instagram.svg'),
              SvgPicture.asset('res/icons/youtube.svg'),
            ],
          ),
          SizedBox(height: 26),
          Container(
            margin: EdgeInsets.only(left: 125, right: 125),
            height: 1,
            decoration: BoxDecoration(color: AppColors.label),
          ),
          SizedBox(height: 32),
          Column(
            children: [
              Text('support@openui.design',
                  style: TxtStyle.font16(AppColors.body)),
              Text('+60 825 876', style: TxtStyle.font16(AppColors.body)),
              Text('08:00 - 22:00 - Everyday',
                  style: TxtStyle.font16(AppColors.body)),
            ],
          ),
          SizedBox(height: 32),
          Container(
            margin: EdgeInsets.only(left: 125, right: 125),
            height: 1,
            decoration: BoxDecoration(color: AppColors.label),
          ),
          SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {},
                child: Text('About',
                    style: TxtStyle.font16(AppColors.titleActive)),
              ),
              GestureDetector(
                onTap: () {},
                child: Text('Contact',
                    style: TxtStyle.font16(AppColors.titleActive)),
              ),
              GestureDetector(
                onTap: () {},
                child:
                    Text('Blog', style: TxtStyle.font16(AppColors.titleActive)),
              )
            ],
          ),
          SizedBox(height: 34),
          Container(
            height: Dimens.HEIGHT_45,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: AppColors.footer.withOpacity(0.1)),
            child: Center(
              child: Text("Copyright© OpenUI All Rights Reserved.",
                  style: TxtStyle.font12(AppColors.label)),
            ),
          )
        ],
      ),
    );
  }
}
