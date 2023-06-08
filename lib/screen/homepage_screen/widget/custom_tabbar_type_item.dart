import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_fashion/theme/colors.dart';
import 'package:open_fashion/theme/dimens.dart';
import 'package:open_fashion/theme/txt_styles.dart';
import 'package:open_fashion/widget/custom_homefull_card.dart';

import '../../../model/product.dart';
import '../../category_view_screen/category_view_screen.dart';
import 'custom_divider.dart';

class TabBarTypeItem extends StatefulWidget {
  const TabBarTypeItem({
    super.key,
    required this.items,
  });
  final List<Product> items;

  @override
  State<TabBarTypeItem> createState() => _TabBarTypeItemState();
}

class _TabBarTypeItemState extends State<TabBarTypeItem>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

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
              custom_item_tabbarview(this.widget.items),
              custom_item_tabbarview(this.widget.items),
              custom_item_tabbarview(this.widget.items),
              custom_item_tabbarview(this.widget.items),
              custom_item_tabbarview(this.widget.items),
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
            itemCount: 4,
            itemBuilder: (_, index) {
              return HomefullCard(
                product: items[index],
              );
            },
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CategoryView(),
              ),
            );
          },
          child: Container(
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
        ),
      ],
    );
  }
}
