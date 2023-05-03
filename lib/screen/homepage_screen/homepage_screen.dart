import 'package:flutter/material.dart';
import 'package:open_fashion/widget/header.dart';
import 'package:open_fashion/widget/footer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_fashion/theme/colors.dart';
import 'package:open_fashion/theme/dimens.dart';
import 'package:open_fashion/theme/txt_styles.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

final urlImages = [
  "res/images/image_slider.png",
];

class _HomepageScreenState extends State<HomepageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              HeaderWidget(),
              CustomCauselSlider(urlImages),
              SizedBox(height: 35),
              Text(
                'New Arrival'.toUpperCase(),
                style: TxtStyle.font18(AppColors.titleActive),
              ),
              SvgPicture.asset(
                'res/icons/divider.svg',
                height: 15,
              ),
              Container(
                height: 465,
                child: Column(
                  children: [
                    Image.asset('res/images/logo.png'),
                    SizedBox(height: 17),
                    Container(
                      width: 283,
                      child: Text(
                        'Making a luxurious lifestyle accessible for a generous group of women is our daily drive.',
                        textAlign: TextAlign.center,
                        style: TxtStyle.font14(AppColors.label),
                      ),
                    ),
                    SizedBox(height: 7),
                    SvgPicture.asset(
                      'res/icons/divider.svg',
                      height: 15,
                    ),
                    SizedBox(height: 13),
                    GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4),
                      children: [
                        CustomCriteria(
                          'res/images/ms1.png',
                          'Fast shipping. Free on orders over \$25.',
                        ),
                      ],
                    ),
                    SizedBox(height: 33),
                    Image.asset('res/images/end.png')
                  ],
                ),
              ),
              FooterWidget()
            ],
          ),
        ),
      ),
    );
  }

  Container CustomCriteria(String urlImage, String title) {
    return Container(
      width: 150,
      child: Column(
        children: [
          Image.asset(urlImage),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TxtStyle.font12(AppColors.label),
          )
        ],
      ),
    );
  }

  Container CustomCauselSlider(List<String> urlImages) {
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
