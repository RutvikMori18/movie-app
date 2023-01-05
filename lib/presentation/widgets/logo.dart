import 'package:flutter/material.dart';
import 'package:movieapp/common/extensions/size_extension.dart';

class Logo extends StatelessWidget {
  final double height;
  const Logo({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      'assets/pngs/logo.png',
      color: Colors.white,
      height: height.h,
    );
  }
}
