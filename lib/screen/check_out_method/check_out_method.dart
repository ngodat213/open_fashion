import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open_fashion/manager/manager_routes.dart';
import 'package:open_fashion/screen/homepage_screen/widget/custom_divider.dart';
import 'package:open_fashion/theme/colors.dart';
import 'package:open_fashion/theme/txt_styles.dart';
import 'package:open_fashion/utils/base_navigation.dart';
import 'package:open_fashion/widget/appbar.dart';
import 'package:open_fashion/widget/menu_drawer.dart';
import 'package:open_fashion/widget/search_drawer.dart';

class CheckOutMethod extends StatefulWidget {
  const CheckOutMethod({super.key});

  @override
  State<CheckOutMethod> createState() => _CheckOutMethodState();
}

class _CheckOutMethodState extends State<CheckOutMethod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      drawer: MenuDrawer(),
      endDrawer: SearchDrawer(),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 33),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'CHECKOUT',
                        style: TxtStyle.font18(AppColors.titleActive),
                      ),
                    ),
                    Center(child: CustomDivider()),
                    SizedBox(height: 16),
                    Text(
                      'SHIPPING ADDRESS',
                      style: TxtStyle.font14(AppColors.placeholder),
                    ),
                    SizedBox(height: 12),
                    _shippingAddressCard(),
                    SizedBox(height: 12),
                    _customButton(
                      onTap: () {
                        print('Add address');
                      },
                      title: 'Add shipping adress',
                      suffix: SvgPicture.asset(
                        'res/icons/plus.svg',
                        color: AppColors.titleActive,
                      ),
                    ),
                    SizedBox(height: 36),
                    Text(
                      'SHIPPING METHOD',
                      style: TxtStyle.font14(AppColors.placeholder),
                    ),
                    SizedBox(height: 12),
                    _customButton(
                      onTap: () {
                        print('Shipping Method');
                      },
                      title: 'Pickup at store',
                      suffix: SvgPicture.asset(
                        'res/icons/Down.svg',
                        color: AppColors.titleActive,
                      ),
                    ),
                    SizedBox(height: 36),
                    Text(
                      'PAYMENT METHOD',
                      style: TxtStyle.font14(AppColors.placeholder),
                    ),
                    SizedBox(height: 12),
                    _customButton(
                      onTap: () {
                        print('Select payment method');
                      },
                      title: 'Pickup at store',
                      suffix: SvgPicture.asset(
                        'res/icons/Down.svg',
                        color: AppColors.titleActive,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _buildBottom(
              sumTotal: 0,
              onTap: () {
                BaseNavigation.push(context,
                    routeName: ManagerRoutes.checkoutCommit);
              },
            )
          ],
        ),
      ),
    );
  }
}

class _buildBottom extends StatelessWidget {
  const _buildBottom({
    required this.sumTotal,
    this.onTap,
  });

  final double sumTotal;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        color: AppColors.offWhite,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Est. Total'.toUpperCase(),
                      style: TxtStyle.font18(AppColors.body)),
                  Text('\$$sumTotal',
                      style: TxtStyle.font18(AppColors.primary)),
                ],
              ),
            ),
            GestureDetector(
              onTap: onTap,
              child: Container(
                height: 56,
                color: AppColors.titleActive,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'res/icons/shopping_bag.svg',
                      color: AppColors.offWhite,
                    ),
                    SizedBox(width: 24),
                    Text('Checkout'.toUpperCase(),
                        style: TxtStyle.font16(AppColors.offWhite)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _customButton extends StatelessWidget {
  const _customButton({
    super.key,
    this.title,
    this.suffix,
    this.onTap,
  });
  final String? title;
  final SvgPicture? suffix;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 13, horizontal: 20),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(44),
          color: AppColors.inputBackground,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title ?? '',
              style: TxtStyle.font16(AppColors.label),
            ),
            if (suffix != null) suffix!,
          ],
        ),
      ),
    );
  }
}

class _shippingAddressCard extends StatelessWidget {
  const _shippingAddressCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Iris Watson',
                style: TxtStyle.font18(AppColors.titleActive),
              ),
              Container(
                width: 198,
                child: Text(
                  '606-3727 Ullamcorper. Street Roseville NH 11523',
                  style: TxtStyle.font14(AppColors.label),
                ),
              ),
              Text(
                '(786) 713-8616',
                style: TxtStyle.font14(AppColors.label),
              )
            ],
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: GestureDetector(
              onTap: () {},
              child: SvgPicture.asset('res/icons/Forward.svg'),
            ),
          )
        ],
      ),
    );
  }
}
