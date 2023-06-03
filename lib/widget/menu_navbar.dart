import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/txt_styles.dart';

class MenuNavbar extends StatelessWidget {
  const MenuNavbar({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;
  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 30),
            alignment: Alignment.center,
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
        ],
      ),
    );
  }
}
