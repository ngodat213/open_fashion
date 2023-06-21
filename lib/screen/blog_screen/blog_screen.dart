import 'package:flutter/material.dart';
import 'package:open_fashion/manager/manager_routes.dart';
import 'package:open_fashion/model/blog.dart';
import 'package:open_fashion/theme/colors.dart';
import 'package:open_fashion/theme/images.dart';
import 'package:open_fashion/theme/txt_styles.dart';
import 'package:open_fashion/utils/base_navigation.dart';
import 'package:open_fashion/widget/appbar.dart';
import 'package:open_fashion/widget/custom_gridview_blog.dart';
import 'package:open_fashion/widget/footer.dart';

import '../homepage_screen/widget/custom_divider.dart';
import 'widget/custom_outline_buttom.dart';
import 'widget/list_type_post.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> listTypeBlog = [
      'Fashion',
      'Promo',
      'Policy',
      'Lookbook',
      'Sale',
      'Cool'
    ];

    final List<Blog> listBlog = [
      new Blog(
        ['#Fashion', '#Tips'],
        Images.imageBlogImage,
        [
          Images.imageBlogImage,
        ],
        '2021 Style Guide: The Biggest Fall Trends',
        [
          'You guys know how much I love mixing high and low-end – it’s the best way to get the most bang for your buck while still elevating your wardrobe. The same goes for handbags! And honestly they are probably the best pieces to mix and match. I truly think the key to completing a look is with a great bag and I found so many this year that I wanted to share a round-up of my most worn handbags.',
          'I found this Saint Laurent canvas handbag this summer and immediately fell in love. The neutral fabrics are so beautiful and I like how this handbag can also carry into fall. The mini Fendi bucket bag with the sheer fabric is so fun and such a statement bag. Also this DeMellier off white bag is so cute to carry to a dinner with you or going out, it’s small but not too small to fit your phone and keys still.'
        ],
        4,
        'OpenFashion',
        false,
      ),
      new Blog(
        ['#Fashion', '#Tips'],
        Images.imageBlogImage,
        [
          Images.imageBlogImage,
        ],
        '2021 Style Guide: The Biggest Fall Trends',
        [
          'You guys know how much I love mixing high and low-end – it’s the best way to get the most bang for your buck while still elevating your wardrobe. The same goes for handbags! And honestly they are probably the best pieces to mix and match. I truly think the key to completing a look is with a great bag and I found so many this year that I wanted to share a round-up of my most worn handbags.',
          'I found this Saint Laurent canvas handbag this summer and immediately fell in love. The neutral fabrics are so beautiful and I like how this handbag can also carry into fall. The mini Fendi bucket bag with the sheer fabric is so fun and such a statement bag. Also this DeMellier off white bag is so cute to carry to a dinner with you or going out, it’s small but not too small to fit your phone and keys still.'
        ],
        4,
        'OpenFashion',
        false,
      ),
      new Blog(
        ['#Fashion', '#Tips'],
        Images.imageBlogImage,
        [
          Images.imageBlogImage,
        ],
        '2021 Style Guide: The Biggest Fall Trends',
        [
          'You guys know how much I love mixing high and low-end – it’s the best way to get the most bang for your buck while still elevating your wardrobe. The same goes for handbags! And honestly they are probably the best pieces to mix and match. I truly think the key to completing a look is with a great bag and I found so many this year that I wanted to share a round-up of my most worn handbags.',
          'I found this Saint Laurent canvas handbag this summer and immediately fell in love. The neutral fabrics are so beautiful and I like how this handbag can also carry into fall. The mini Fendi bucket bag with the sheer fabric is so fun and such a statement bag. Also this DeMellier off white bag is so cute to carry to a dinner with you or going out, it’s small but not too small to fit your phone and keys still.'
        ],
        4,
        'OpenFashion',
        false,
      ),
      new Blog(
        ['#Fashion', '#Tips'],
        Images.imageBlogImage,
        [
          Images.imageBlogImage,
        ],
        '2021 Style Guide: The Biggest Fall Trends',
        [
          'You guys know how much I love mixing high and low-end – it’s the best way to get the most bang for your buck while still elevating your wardrobe. The same goes for handbags! And honestly they are probably the best pieces to mix and match. I truly think the key to completing a look is with a great bag and I found so many this year that I wanted to share a round-up of my most worn handbags.',
          'I found this Saint Laurent canvas handbag this summer and immediately fell in love. The neutral fabrics are so beautiful and I like how this handbag can also carry into fall. The mini Fendi bucket bag with the sheer fabric is so fun and such a statement bag. Also this DeMellier off white bag is so cute to carry to a dinner with you or going out, it’s small but not too small to fit your phone and keys still.'
        ],
        4,
        'OpenFashion',
        false,
      ),
    ];
    return Scaffold(
      appBar: CustomAppbar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30),
              Text('BLOG', style: TxtStyle.font18(AppColors.titleActive)),
              CustomDivider(),
              ListTypeBlog(listTypeBlog: listTypeBlog),
              SizedBox(height: 32),
              Column(
                children: listBlog
                    .map((e) => GridViewBlog(
                          blog: e,
                          onTap: () {},
                        ))
                    .toList(),
              ),
              CustomOutlineButton(
                text: 'Load more',
                onPressed: () {
                  BaseNavigation.push(context,
                      routeName: ManagerRoutes.blogScreen);
                },
              ),
              FooterWidget()
            ],
          ),
        ),
      ),
    );
  }
}
