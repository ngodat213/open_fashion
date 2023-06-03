import 'package:flutter/material.dart';

import '../../../theme/colors.dart';
import '../../../theme/txt_styles.dart';

class ListTypeBlog extends StatelessWidget {
  const ListTypeBlog({
    super.key,
    required this.listTypeBlog,
  });

  final List<String> listTypeBlog;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: listTypeBlog
            .map(
              (e) => Container(
                padding: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 10,
                ),
                margin: EdgeInsets.only(left: 12),
                decoration: BoxDecoration(
                  color: AppColors.inputBackground,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  e,
                  style: TxtStyle.font14(AppColors.titleActive),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
