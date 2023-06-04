import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open_fashion/theme/colors.dart';
import 'package:open_fashion/theme/txt_styles.dart';
import 'package:open_fashion/utils/base_navigation.dart';
import 'package:open_fashion/widget/base_text.dart';
import 'package:open_fashion/widget/custom_tag_border.dart';
import 'package:open_fashion/widget/custom_tag_fill.dart';

class SearchDrawer extends StatefulWidget {
  const SearchDrawer({
    super.key,
  });

  @override
  State<SearchDrawer> createState() => _SearchDrawerState();
}

class _SearchDrawerState extends State<SearchDrawer> {
  List<String> recentSearch = ['Dress', 'Collection', 'Nike'];
  List<String> popularSearch = [
    'Trend',
    'Dress',
    'Bag',
    'Tshirt',
    'Beauty',
    'Acessories'
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        width: MediaQuery.of(context).size.width,
        child: Container(
          margin: EdgeInsets.only(left: 16, top: 17, right: 45),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 35,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search items',
                    prefixIcon: SvgPicture.asset(
                      'res/icons/search.svg',
                      width: 16,
                      height: 16,
                    ),
                    suffixIcon: GestureDetector(
                        onTap: () {
                          BaseNavigation.pop(context);
                        },
                        child: SvgPicture.asset('res/icons/close.svg')),
                  ),
                ),
              ),
              SizedBox(height: 16),
              BaseText(
                'Recent search',
                style: TxtStyle.font14(AppColors.placeholder),
              ),
              SizedBox(height: 6),
              Wrap(
                spacing: 3,
                runSpacing: 3,
                children: recentSearch
                    .map((e) => TagFill(
                          title: e,
                          suffix: SvgPicture.asset('res/icons/close.svg'),
                        ))
                    .toList(),
              ),
              SizedBox(height: 18),
              BaseText(
                'Popular search terms',
                style: TxtStyle.font14(AppColors.placeholder),
              ),
              SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: popularSearch
                    .map((e) => InkWell(
                          onTap: () {},
                          child: Container(
                            margin: EdgeInsets.only(bottom: 16),
                            child: Text(
                              e,
                              style: TxtStyle.font16(AppColors.titleActive),
                            ),
                          ),
                        ))
                    .toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
