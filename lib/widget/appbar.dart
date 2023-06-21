import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open_fashion/manager/manager_routes.dart';
import 'package:open_fashion/theme/images.dart';
import 'package:open_fashion/utils/base_navigation.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Stack(
          children: [
            Positioned.fill(
              child: InkWell(
                  onTap: () {
                    BaseNavigation.push(context,
                        routeName: ManagerRoutes.homePage);
                  },
                  child:
                      Center(child: Image.asset(Images.imageLogo, width: 100))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: SvgPicture.asset(Images.iconMenu)),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                      icon: SvgPicture.asset(Images.iconSearch),
                    ),
                    IconButton(
                      onPressed: () {
                        BaseNavigation.push(context,
                            routeName: ManagerRoutes.checkoutScreen);
                      },
                      icon: SvgPicture.asset(Images.iconCart),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 60);
}
