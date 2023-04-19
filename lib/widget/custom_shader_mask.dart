import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomShaderMask extends StatelessWidget {
  const CustomShaderMask({super.key});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return RadialGradient(
          center: Alignment.topLeft,
          radius: 1.0,
          colors: <Color>[Colors.grey, Colors.black],
          stops: <double>[0.0, 1.0],
        ).createShader(bounds);
      },
      blendMode: BlendMode.darken,
      child: SvgPicture.asset(
        'assets/images/my_svg_image.svg',
        color: Colors.white,
      ),
    );
  }
}
