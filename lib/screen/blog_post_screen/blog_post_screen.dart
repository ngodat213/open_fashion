import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open_fashion/theme/colors.dart';
import 'package:open_fashion/theme/txt_styles.dart';
import 'package:open_fashion/widget/custom_tag_border.dart';
import 'package:open_fashion/widget/footer.dart';

import '../../widget/appbar.dart';

class BlogPostScreen extends StatefulWidget {
  const BlogPostScreen({
    super.key,
    required this.fashionPost,
    required this.tags,
  });
  final List<String> fashionPost;
  final List<String> tags;

  @override
  State<BlogPostScreen> createState() => _BlogPostScreenState();
}

int pageNo = 0;

class _BlogPostScreenState extends State<BlogPostScreen> {
  @override
  Widget build(BuildContext context) {
    int len;
    return Scaffold(
      appBar: CustomAppbar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                'https://img.freepik.com/free-vector/elegant-fashion-poster-template_1361-1220.jpg?w=1060&t=st=1684838188~exp=1684838788~hmac=c5323a8a92439b1c2525c90bdb2a7dceb99902d329fb309892b02218c1b3d3c6',
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '2021 Style Guide: The Biggest Fall Trends'.toUpperCase(),
                      style: TxtStyle.font14(AppColors.titleActive),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'You guys know how much I love mixing high and low-end – it’s the best way to get the most bang for your buck while still elevating your wardrobe. The same goes for handbags! And honestly they are probably the best pieces to mix and match. I truly think the key to completing a look is with a great bag and I found so many this year that I wanted to share a round-up of my most worn handbags.',
                      style: TxtStyle.font14(AppColors.titleActive),
                      textAlign: TextAlign.justify,
                    ),
                    CarouselSlider.builder(
                      itemCount: widget.fashionPost.length,
                      options: CarouselOptions(
                        height: 600,
                        viewportFraction: 1,
                        autoPlay: true,
                        reverse: false,
                        onPageChanged: (index, reason) {
                          pageNo = index;
                          setState(() {});
                        },
                      ),
                      itemBuilder: (context, index, realIndex) {
                        return Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 15, bottom: 15),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        NetworkImage(widget.fashionPost[index]),
                                    fit: BoxFit.fitHeight),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          widget.fashionPost.length,
                          (i) => Container(
                                margin: EdgeInsets.only(left: 5),
                                child: SvgPicture.asset(
                                  pageNo != i
                                      ? 'res/icons/diamond-unselect.svg'
                                      : 'res/icons/diamond-select.svg',
                                  width: 8,
                                ),
                              )).toList(),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'I found this Saint Laurent canvas handbag this summer and immediately fell in love. The neutral fabrics are so beautiful and I like how this handbag can also carry into fall. The mini Fendi bucket bag with the sheer fabric is so fun and such a statement bag. Also this DeMellier off white bag is so cute to carry to a dinner with you or going out, it’s small but not too small to fit your phone and keys still.',
                      style: TxtStyle.font14(AppColors.titleActive),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Posted by OpenFashion | 3 Days ago',
                      style: TxtStyle.font14(AppColors.titleActive),
                    ),
                    SizedBox(height: 10),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      alignment: WrapAlignment.start,
                      children: widget.tags
                          .map((e) => TagBorder(title: e, isSearch: false))
                          .toList(),
                    ),
                  ],
                ),
              ),
              FooterWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
