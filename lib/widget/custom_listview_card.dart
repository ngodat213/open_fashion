import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_fashion/generated/l10n.dart';
import 'package:open_fashion/model/product.dart';
import 'package:open_fashion/theme/colors.dart';
import 'package:open_fashion/theme/images.dart';
import 'package:open_fashion/theme/txt_styles.dart';
import 'package:open_fashion/theme/dimens.dart';
import 'package:open_fashion/utils/base_utils.dart';
import 'package:open_fashion/widget/custom_size_button.dart';

import '../screen/product_detail_screen/product_detail_screen.dart';

class ListViewCard extends StatelessWidget {
  const ListViewCard({
    required this.product,
    this.favorite = false,
    super.key,
  });
  final Product product;
  final bool? favorite;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(
              product: product,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: Dimens.PADDING_12),
        height: Dimens.HEIGHT_134,
        width: BaseUtils.getScreenWidth(context),
        child: Row(
          children: [
            Container(
              height: Dimens.HEIGHT_134,
              width: Dimens.WIDTH_100,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(product.thumbUrl!))),
            ),
            Container(
              width: BaseUtils.getScreenWidth(context) - 143,
              margin: EdgeInsets.only(left: Dimens.PADDING_11),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: Dimens.HEIGHT_7),
                  Text(product.name!.toUpperCase(),
                      style: TxtStyle.font14(AppColors.titleActive)),
                  SizedBox(height: Dimens.HEIGHT_6),
                  Text(product.title!,
                      style: TxtStyle.font12(AppColors.titleActive)),
                  SizedBox(height: Dimens.HEIGHT_4),
                  Text('\$${product.price}',
                      style: TxtStyle.font14(AppColors.secondary)),
                  SizedBox(height: Dimens.HEIGHT_11),
                  _customRating(product: product),
                  SizedBox(height: Dimens.HEIGHT_11),
                  _customSize(product: product),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _customRating extends StatelessWidget {
  const _customRating({
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          WidgetSpan(
            child: Padding(
              padding: EdgeInsets.only(right: Dimens.PADDING_3),
              child: SvgPicture.asset(Images.iconRating),
            ),
          ),
          TextSpan(
            text: '${product.rating} ${S.of(context).rating}',
            style: TxtStyle.font12(AppColors.label),
          )
        ],
      ),
    );
  }
}

class _customSize extends StatelessWidget {
  const _customSize({
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(S.of(context).size, style: TxtStyle.font12(AppColors.label)),
            Row(
              children: product.size!
                  .map((e) => ButtonSize(size: e.toUpperCase()))
                  .toList(),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(right: Dimens.SCREEN_PADDING),
          child: SvgPicture.asset(
            Images.iconFavorite,
            height: Dimens.HEIGHT_16,
            width: Dimens.WIDTH_16,
            color: AppColors.secondary,
          ),
        ),
      ],
    );
  }
}
