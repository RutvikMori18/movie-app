import 'package:flutter/material.dart';
import 'package:movieapp/common/extensions/size_extension.dart';

import '../../common/constants/size_constants.dart';
import '../themes/theme_color.dart';

class Separator extends StatelessWidget {
  const Separator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizes.dimen_1.h,
      width: Sizes.dimen_80.w,
      padding: EdgeInsets.only(
        top: Sizes.dimen_2.h,
        bottom: Sizes.dimen_6.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(Sizes.dimen_1.h)),
        gradient: const LinearGradient(
          colors: [
            AppTheme.violet,
            AppTheme.royalBlue,
          ],
        ),
      ),
    );
  }
}
