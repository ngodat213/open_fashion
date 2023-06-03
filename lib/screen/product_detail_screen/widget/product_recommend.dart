import 'package:flutter/material.dart';
import 'package:open_fashion/model/product.dart';

import '../../../theme/colors.dart';
import '../../../theme/txt_styles.dart';
import '../../../widget/custom_gridview_card.dart';
import '../../homepage_screen/widget/custom_divider.dart';

class ProductRecommend extends StatelessWidget {
  const ProductRecommend({
    super.key,
    required this.products,
  });
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'YOU MAY ALSO LIKE',
          style: TxtStyle.font18(AppColors.titleActive),
        ),
        CustomDivider(),
        SizedBox(height: 20),
        Container(
          margin: EdgeInsets.only(left: 16),
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 19,
              crossAxisSpacing: 12,
              mainAxisExtent: 280,
            ),
            itemCount: 4,
            itemBuilder: (context, index) {
              return GridViewCard(product: products[index]);
            },
          ),
        ),
      ],
    );
  }
}
