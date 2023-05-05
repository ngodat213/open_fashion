import 'package:flutter/material.dart';

class CustomGridviewBrand extends StatelessWidget {
  const CustomGridviewBrand({
    required this.listBrand,
    super.key,
  });

  final List<String> listBrand;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 13,
        mainAxisSpacing: 11,
        mainAxisExtent: 30,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return Container(
          child: Image.asset('res/images/Catier.png'),
        );
      },
    );
  }
}
