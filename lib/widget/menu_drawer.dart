import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open_fashion/screen/homepage_screen/widget/custom_divider.dart';
import 'package:open_fashion/utils/base_navigation.dart';
import 'package:open_fashion/widget/base_text.dart';
import 'package:open_fashion/widget/custom_text_icon.dart';

import '../theme/colors.dart';
import '../theme/txt_styles.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({
    super.key,
  });

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final List<String> _type = [
      'Outer',
      'Dress',
      'Blouse/shirt',
      'T-shirt',
      'Knitwear',
      'Skirt',
      'Pants',
      'Denim',
      'Kids',
    ];
    return SafeArea(
      child: Drawer(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 16),
              child: IconButton(
                  onPressed: () {
                    BaseNavigation.pop(context);
                  },
                  icon: SvgPicture.asset('res/icons/close.svg')),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: TabBar(
                tabs: [
                  Tab(text: 'WOMAN'),
                  Tab(text: 'MAN'),
                  Tab(text: 'KIDS'),
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomExpansionTile(title: 'New', type: _type),
                      CustomExpansionTile(title: 'Apparel', type: _type),
                      CustomExpansionTile(title: 'Bag', type: _type),
                      CustomExpansionTile(title: 'Shoes', type: _type),
                      CustomExpansionTile(title: 'Beauty', type: _type),
                      CustomExpansionTile(title: 'Accessories', type: _type),
                      CustomTextIcon(
                        '(786) 713-8616',
                        prefix: 'res/icons/call.svg',
                        style: TxtStyle.font16(AppColors.label),
                        magin: EdgeInsets.only(bottom: 16, left: 16, top: 36),
                      ),
                      CustomTextIcon(
                        'Store locator',
                        prefix: 'res/icons/Location.svg',
                        style: TxtStyle.font16(AppColors.label),
                        magin: EdgeInsets.only(bottom: 16, left: 16),
                      ),
                      SizedBox(height: 16),
                      Center(child: CustomDivider()),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset('res/icons/twitter.svg'),
                          SvgPicture.asset('res/icons/instagram.svg'),
                          SvgPicture.asset('res/icons/youtube.svg'),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomExpansionTile extends StatelessWidget {
  const CustomExpansionTile({
    super.key,
    required List<String> type,
    required this.title,
  }) : _type = type;

  final List<String> _type;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: BaseText(
        title,
        style: TxtStyle.font16(AppColors.body),
      ),
      expandedAlignment: Alignment.topLeft,
      children: _type
          .map((e) => Container(
                padding: EdgeInsets.only(left: 36, bottom: 36),
                alignment: Alignment.topLeft,
                child: BaseText(
                  e,
                  style: TxtStyle.font16(AppColors.body),
                ),
              ))
          .toList(),
    );
  }
}
