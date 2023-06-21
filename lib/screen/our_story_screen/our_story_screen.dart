import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_fashion/screen/homepage_screen/widget/custom_divider.dart';
import 'package:open_fashion/theme/colors.dart';
import 'package:open_fashion/theme/images.dart';
import 'package:open_fashion/theme/txt_styles.dart';
import 'package:open_fashion/widget/appbar.dart';
import 'package:open_fashion/widget/menu_drawer.dart';
import 'package:open_fashion/widget/search_drawer.dart';

class OurStoryScreen extends StatelessWidget {
  const OurStoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      drawer: MenuDrawer(),
      endDrawer: SearchDrawer(),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  _buildOurStory(),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 238,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('res/images/thumb.png'),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  SizedBox(height: 45),
                  _buildSignUp(),
                  SizedBox(height: 28),
                  _buildButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _buildButton extends StatelessWidget {
  const _buildButton({
    super.key,
    this.onTap,
  });
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56,
        width: MediaQuery.of(context).size.width,
        color: AppColors.titleActive,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'SUBMIT'.toUpperCase(),
              style: TxtStyle.font16(AppColors.offWhite),
            ),
            SizedBox(width: 24),
            SvgPicture.asset(
              Images.iconForwardArrow,
              color: AppColors.offWhite,
            ),
          ],
        ),
      ),
    );
  }
}

class _buildSignUp extends StatelessWidget {
  const _buildSignUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Text(
            'SIGN UP',
            style: TxtStyle.font18(AppColors.titleActive),
          ),
          CustomDivider(),
          Text(
            'Receive early access to new arrivals, sales, exclusive content, events and much more!',
            style: TxtStyle.font14(AppColors.titleActive),
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              hintText: 'Email Address',
            ),
          )
        ],
      ),
    );
  }
}

class _buildOurStory extends StatelessWidget {
  const _buildOurStory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 33),
      child: Column(
        children: [
          Text(
            'OUR STORY',
            style: TxtStyle.font18(AppColors.titleActive),
          ),
          CustomDivider(),
          SizedBox(height: 18),
          Text(
            'Open Fashion - Free Ecommerce UI Kit is a free download UI kit. You can open Open Fashion - Free Ecommerce UI Kit file by Figma.',
            style: TxtStyle.font16(AppColors.titleActive),
          ),
          SizedBox(height: 8),
          Text(
            'Create stunning shop with bulletproof guidelines and thoughtful components. Its library contains more than 50+ components supporting Light & Dark Mode and 60+ ready to use mobile screens.',
            style: TxtStyle.font16(AppColors.titleActive),
          ),
        ],
      ),
    );
  }
}
