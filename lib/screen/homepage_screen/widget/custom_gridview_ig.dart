import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_fashion/theme/txt_styles.dart';
import 'package:open_fashion/model/user_ig.dart';
import 'package:open_fashion/theme/colors.dart';
import 'package:open_fashion/theme/dimens.dart';

class CustomGridviewIg extends StatelessWidget {
  const CustomGridviewIg({
    super.key,
    required this.listIg,
  });

  final List<Instagram> listIg;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 32),
      child: Column(
        children: [
          Text(
            'Follow Us'.toUpperCase(),
            style: TxtStyle.font18(AppColors.titleActive),
          ),
          SvgPicture.asset('res/icons/instagram.svg'),
          SizedBox(height: Dimens.HEIGHT_20),
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              mainAxisExtent: MediaQuery.of(context).size.width * 0.45,
            ),
            itemCount: 4,
            itemBuilder: (context, index) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    height: MediaQuery.of(context).size.width * 0.45,
                    child: Image.asset(
                      listIg[index].imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 12,
                    left: MediaQuery.of(context).size.width * 0.05,
                    child: Text(
                      '@' + listIg[index].username,
                      style: TxtStyle.font14(AppColors.background),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
