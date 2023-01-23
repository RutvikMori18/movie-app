import 'package:flutter/material.dart';
import 'package:movieapp/common/extensions/size_extension.dart';

import '../../../../common/constants/size_constants.dart';

class MovieDetailAppBar extends StatelessWidget {
  const MovieDetailAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: Sizes.dimen_12.h,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.favorite_border_rounded,
              color: Colors.white, size: Sizes.dimen_12.h),
        ),
      ],
    );
  }
}
