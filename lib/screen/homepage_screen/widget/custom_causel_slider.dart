import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_fashion/screen/homepage_screen/homepage_screen.dart';
import 'package:open_fashion/theme/colors.dart';
import 'package:open_fashion/theme/dimens.dart';
import 'package:open_fashion/theme/txt_styles.dart';

class CustomCauselSlider extends StatefulWidget {
  const CustomCauselSlider(this.urlImages, {super.key});
  final List<String> urlImages;

  @override
  State<CustomCauselSlider> createState() => _CustomCauselSliderState();
}

class _CustomCauselSliderState extends State<CustomCauselSlider> {
  int pageNo = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider.builder(
        itemCount: widget.urlImages.length,
        itemBuilder: (context, index, realIndex) {
          final urlImage = widget.urlImages[index];
          final len = urlImages.length;
          return SliderBanner(urlImage: urlImage, len: len, index: index);
        },
        options: CarouselOptions(
          height: 600,
          viewportFraction: 1,
          autoPlay: true,
          reverse: false,
        ),
      ),
    );
  }
}

class SliderBanner extends StatelessWidget {
  const SliderBanner({
    super.key,
    required this.urlImage,
    required this.len,
    required this.index,
  });

  final String urlImage;
  final int len, index;

  @override
  Widget build(BuildContext context) {
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
              _btnExploreCollection(),
              _buildIndicator(),
            ],
          ),
        )
      ],
    );
  }

  Row _buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          len,
          (i) => Container(
                margin: EdgeInsets.only(left: 5),
                child: SvgPicture.asset(
                  'res/icons/diamond-solid.svg',
                  width: 8,
                  color:
                      index != i ? AppColors.background : AppColors.placeholder,
                ),
              )).toList(),
    );
  }

  Container _btnExploreCollection() {
    return Container(
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
    );
  }
}
