import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_fashion/theme/colors.dart';
import 'package:open_fashion/theme/txt_styles.dart';
import 'package:open_fashion/theme/dimens.dart';
import 'package:open_fashion/widget/custom_size_button.dart';

class ListViewCard extends StatelessWidget {
  const ListViewCard(
      {required this.thumbUrl,
      required this.name,
      required this.title,
      required this.price,
      required this.ratting,
      required this.size,
      this.favorite,
      super.key});
  final String thumbUrl;
  final String name;
  final String title;
  final double price;
  final double ratting;
  final List<String> size;
  final bool? favorite;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimens.HEIGHT_134,
      width: MediaQuery.of(context).size.width,
      child: Row(children: [
        Container(
          height: Dimens.HEIGHT_134,
          width: Dimens.WIDTH_100,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(thumbUrl))),
        ),
        Container(
          width: MediaQuery.of(context).size.width - 111,
          margin: EdgeInsets.only(left: Dimens.PADDING_11),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(height: Dimens.HEIGHT_7),
            Text(name.toUpperCase(),
                style: TxtStyle.font14(AppColors.titleActive)),
            SizedBox(height: Dimens.HEIGHT_6),
            Text(title, style: TxtStyle.font12(AppColors.titleActive)),
            SizedBox(height: Dimens.HEIGHT_4),
            Text('\$$price', style: TxtStyle.font14(AppColors.secondary)),
            SizedBox(height: Dimens.HEIGHT_11),
            _customRatting(),
            SizedBox(height: Dimens.HEIGHT_11),
            _customSize(),
          ]),
        )
      ]),
    );
  }

  Row _customSize() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(children: [
        Text('Size', style: TxtStyle.font12(AppColors.label)),
        Row(
            children: List.generate(size.length,
                (index) => ButtonSize(size: size[index].toUpperCase())))
      ]),
      Container(
        margin: EdgeInsets.only(right: Dimens.SCREEN_PADDING),
        child: SvgPicture.asset(
          'res/icons/favorite.svg',
          height: Dimens.HEIGHT_16,
          width: Dimens.WIDTH_16,
          color: AppColors.secondary,
        ),
      ),
    ]);
  }

  RichText _customRatting() {
    return RichText(
      text: TextSpan(children: [
        WidgetSpan(
          child: Padding(
            padding: EdgeInsets.only(right: Dimens.PADDING_3),
            child: SvgPicture.asset('res/icons/ratting.svg'),
          ),
        ),
        TextSpan(
          text: '$ratting Ratings',
          style: TxtStyle.font12(AppColors.label),
        )
      ]),
    );
  }
}
