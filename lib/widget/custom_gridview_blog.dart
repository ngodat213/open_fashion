// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:open_fashion/model/blog.dart';
import 'package:open_fashion/theme/colors.dart';
import 'package:open_fashion/theme/dimens.dart';
import 'package:open_fashion/theme/txt_styles.dart';
import 'package:open_fashion/widget/custom_tag_fill.dart';

class GridViewBlog extends StatelessWidget {
  const GridViewBlog({
    Key? key,
    required this.blog,
  }) : super(key: key);
  final Blog blog;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 28),
      width: Dimens.WIDTH_343,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(blog.thumb),
              Positioned(
                top: 11,
                right: 8,
                child: SvgPicture.asset(
                  'res/icons/bookmark.svg',
                  width: 18,
                  height: 18,
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: 343,
                  height: 86,
                  decoration: BoxDecoration(gradient: AppColors.myGradient),
                  child: Padding(
                    padding: EdgeInsets.only(left: 14, top: 33, right: 14),
                    child: Text(
                      blog.title.toUpperCase(),
                      style: TxtStyle.font14(AppColors.offWhite),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: blog.types.map((e) => TagFill(title: e)).toList(),
              ),
              Text('${blog.timePost} days ago')
            ],
          ),
        ],
      ),
    );
  }
}
