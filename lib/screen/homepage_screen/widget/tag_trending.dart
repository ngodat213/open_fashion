import 'package:flutter/material.dart';

import '../../../theme/colors.dart';
import '../../../theme/txt_styles.dart';
import '../../../widget/custom_tag_fill.dart';

class TagTrending extends StatelessWidget {
  const TagTrending({
    super.key,
    required this.tags,
  });

  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 44),
        Text(
          '@Trending'.toUpperCase(),
          style: TxtStyle.font18(AppColors.titleActive),
        ),
        SizedBox(height: 8),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: tags.map((e) => TagFill(title: e)).toList(),
        )
      ],
    );
  }
}
