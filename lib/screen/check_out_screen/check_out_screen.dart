import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open_fashion/manager/manager_routes.dart';
import 'package:open_fashion/model/cart.dart';
import 'package:open_fashion/screen/homepage_screen/widget/custom_divider.dart';
import 'package:open_fashion/theme/colors.dart';
import 'package:open_fashion/theme/txt_styles.dart';
import 'package:open_fashion/utils/base_navigation.dart';
import 'package:open_fashion/widget/appbar.dart';
import 'package:open_fashion/widget/base_text.dart';

import 'package:flutter/services.dart' as rootBundle;
import 'package:open_fashion/widget/cart_card.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  List<Cart> carts = [];
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    List<Cart> data = await getDataJson();
    setState(() {
      carts = data;
    });
  }

  Future<List<Cart>> getDataJson() async {
    final jsondata =
        await rootBundle.rootBundle.loadString('lib/json/cart.json');
    final List list = json.decode(jsondata) as List<dynamic>;

    return list.map((e) => Cart.fromJson(e)).toList();
  }

  double sumTotal = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            margin: EdgeInsets.only(top: 33),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Checkout'.toUpperCase(),
                    style: TxtStyle.font18(AppColors.titleActive),
                  ),
                  CustomDivider(),
                  Container(
                    margin: EdgeInsets.only(left: 16, top: 16),
                    child: Column(
                        children: carts.map((e) => CartCard(cart: e)).toList()),
                  ),
                  Divider(color: AppColors.titleActive.withOpacity(0.2)),
                  _customExpansionTile(
                    title: 'Add promo code',
                    prefix: 'res/icons/Voucher.svg',
                    onPressed: () {
                      print('hello');
                    },
                  ),
                  Divider(color: AppColors.titleActive.withOpacity(0.2)),
                  _customExpansionTile(
                    title: 'Delivery',
                    description: 'Free',
                    prefix: 'res/icons/Delivery.svg',
                    onPressed: () {
                      print('hello');
                    },
                  ),
                  Divider(color: AppColors.titleActive.withOpacity(0.2)),
                  SizedBox(height: 156),
                ],
              ),
            ),
          ),
          _buildBottom(sumTotal: 0),
        ],
      ),
    );
  }
}

class _buildBottom extends StatelessWidget {
  const _buildBottom({
    required this.sumTotal,
  });

  final double sumTotal;

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
              onTap: () {
                BaseNavigation.push(context,
                    routeName: ManagerRoutes.checkoutMethod);
              },
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

class _customExpansionTile extends StatelessWidget {
  const _customExpansionTile({
    this.title,
    this.prefix,
    this.description,
    this.onPressed,
  });
  final String? prefix;
  final String? title;
  final String? description;
  final Function? onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed?.call();
      },
      child: Container(
        height: 44,
        width: MediaQuery.of(context).size.width - 60,
        margin: EdgeInsets.only(left: 33, right: 27),
        child: Row(
          children: [
            SvgPicture.asset(
              prefix ?? '',
              width: 24,
            ),
            SizedBox(width: 10),
            Container(
              width: MediaQuery.of(context).size.width - 117,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BaseText(
                    title,
                    style: TxtStyle.font14(AppColors.body),
                  ),
                  BaseText(
                    description,
                    style: TxtStyle.font14(AppColors.body),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
