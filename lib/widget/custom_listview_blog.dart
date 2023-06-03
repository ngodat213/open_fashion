import 'package:flutter/material.dart';
import 'package:open_fashion/theme/txt_styles.dart';
import 'package:open_fashion/theme/dimens.dart';
import 'package:open_fashion/theme/colors.dart';

class ListViewBlog extends StatelessWidget {
  const ListViewBlog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimens.HEIGHT_155,
      child: Row(
        children: [
          Image.asset(
            'res/images/blog_listview.png',
            height: Dimens.HEIGHT_155,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, left: 12),
            child: Stack(
              children: [
                Container(
                  width: Dimens.WIDTH_211,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '2021 Style Guide:\nThe Biggest Fall\nTrends forecasts forecasts'
                            .toUpperCase(),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TxtStyle.font14(AppColors.titleActive),
                      ),
                      Text(
                          'The excitement of fall fashion is here and I’m already loving some of the trend forecasts forecastsforecasts',
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style:
                              TxtStyle.font14(AppColors.body.withOpacity(0.8))),
                    ],
                  ),
                ),
                Positioned(
                  left: 0,
                  bottom: 0,
                  child: Text('16/10/2021',
                      style: TxtStyle.font12(AppColors.placeholder)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
