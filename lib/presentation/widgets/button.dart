import 'package:flutter/material.dart';
import 'package:movieapp/common/constants/size_constants.dart';
import 'package:movieapp/common/extensions/size_extension.dart';
import 'package:movieapp/common/extensions/string_extension.dart';
import 'package:movieapp/presentation/themes/theme_color.dart';

class Button extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final bool? isEnable;
  const Button(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.isEnable = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizes.dimen_20.h,
      padding: EdgeInsets.symmetric(vertical: Sizes.dimen_16.w),
      margin: EdgeInsets.symmetric(vertical: Sizes.dimen_12.h),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppTheme.royalBlue, AppTheme.violet],
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(Sizes.dimen_20.w),
        ),
      ),
      child: TextButton(
        onPressed: isEnable ?? true ? onPressed : null,
        child: Text(
          text.t(context),
          style: Theme.of(context).textTheme.button,
        ),
      ),
    );
  }
}
