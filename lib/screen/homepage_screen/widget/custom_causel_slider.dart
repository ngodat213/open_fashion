import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_fashion/theme/colors.dart';
import 'package:open_fashion/theme/dimens.dart';
import 'package:open_fashion/theme/txt_styles.dart';

class CustomCauselSlider extends StatelessWidget {
  const CustomCauselSlider(this.urlImages, {super.key});
  final List<String> urlImages;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider.builder(
        itemCount: urlImages.length,
        itemBuilder: (context, index, realIndex) {
          final urlImage = urlImages[index];
          return Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(urlImage), fit: BoxFit.fitHeight),
                ),
              ),
              Positioned(
                bottom: 20,
                right: 0,
                left: 0,
                child: Column(
                  children: [
                    Container(
                      width: 253,
                      height: 40,
                      margin: EdgeInsets.only(bottom: 14),
                      decoration: BoxDecoration(
                        color: AppColors.titleActive.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(Dimens.RADIUS_100),
                      ),
                      child: Center(
                          child: Text(
                        'Explore Collection'.toUpperCase(),
                        style: TxtStyle.font16(AppColors.offWhite),
                      )),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomJumpingDotEffect(true),
                        CustomJumpingDotEffect(false),
                        CustomJumpingDotEffect(false),
                      ],
                    ),
                  ],
                ),
              )
            ],
          );
        },
        options: CarouselOptions(
          height: 600,
          viewportFraction: 1,
          autoPlay: true,
          reverse: true,
        ),
      ),
    );
  }

  Container CustomJumpingDotEffect(bool isSelected) {
    return Container(
      margin: EdgeInsets.only(left: 4),
      child: SvgPicture.asset(
        isSelected ? 'res/icons/dot_jumping.svg' : 'res/icons/dot_jumping2.svg',
        color: AppColors.offWhite,
      ),
    );
  }
}
