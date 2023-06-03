import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_fashion/theme/colors.dart';
import 'package:open_fashion/theme/dimens.dart';
import 'package:open_fashion/theme/txt_styles.dart';
import 'package:open_fashion/widget/custom_homefull_card.dart';

import '../../../model/product.dart';
import 'custom_divider.dart';

class TabBarTypeItem extends StatelessWidget {
  const TabBarTypeItem({
    super.key,
    required TabController tabController,
    required this.items,
  }) : _tabController = tabController;
  final List<Product> items;
  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Dimens.HEIGHT_32),
      height: MediaQuery.of(context).size.height - 9,
      child: Column(
        children: [
          Text(
            'New Arrival'.toUpperCase(),
            style: TxtStyle.font18(AppColors.titleActive),
          ),
          CustomDivider(),
          Container(
            margin: EdgeInsets.only(top: 30),
            alignment: Alignment.center,
            child: TabBar(
              tabs: [
                Tab(text: 'All'),
                Tab(text: 'Apparel'),
                Tab(text: 'Dress'),
                Tab(text: 'Tshirt'),
                Tab(text: 'Bag'),
              ],
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: AppColors.titleActive,
              unselectedLabelStyle: TxtStyle.font14(AppColors.placeholder),
            ),
          ),
          Expanded(
              child: TabBarView(
            controller: _tabController,
            children: [
              custom_item_tabbarview(this.items),
              custom_item_tabbarview(this.items),
              custom_item_tabbarview(this.items),
              custom_item_tabbarview(this.items),
              custom_item_tabbarview(this.items),
            ],
          )),
        ],
      ),
    );
  }
}

class custom_item_tabbarview extends StatelessWidget {
  const custom_item_tabbarview(
    this.items, {
    super.key,
  });
  final List<Product> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 13,
              mainAxisSpacing: 11,
              mainAxisExtent: 265,
            ),
            itemCount: items.length,
            itemBuilder: (_, index) {
              return HomefullCard(
                item: items[index],
              );
            },
          ),
        ),
        Container(
          width: 155,
          height: 48,
          alignment: Alignment.center,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Explore More'),
                SvgPicture.asset('res/icons/forward_arrow.svg',
                    color: AppColors.titleActive, width: 18)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
