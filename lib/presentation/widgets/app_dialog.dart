import 'package:flutter/material.dart';
import 'package:movieapp/common/constants/translation_constants.dart';
import 'package:movieapp/common/extensions/size_extension.dart';
import 'package:movieapp/common/extensions/string_extension.dart';
import 'package:movieapp/presentation/widgets/button.dart';

import '../../common/constants/size_constants.dart';
import '../themes/theme_color.dart';

class AppDialog extends StatelessWidget {
  final String title, description, buttonText;
  final Widget? image;
  const AppDialog(
      {Key? key,
      required this.title,
      required this.description,
      required this.buttonText,
      this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppTheme.vulcan,
      elevation: Sizes.dimen_32,
      insetPadding: EdgeInsets.all(
        Sizes.dimen_32.w,
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Sizes.dimen_8.w)),
      child: Container(
        padding: EdgeInsets.only(
          top: Sizes.dimen_4.h,
          right: Sizes.dimen_16.w,
          left: Sizes.dimen_16.w,
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: AppTheme.vulcan, blurRadius: Sizes.dimen_16.h)
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title.t(context),
              style: Theme.of(context).textTheme.headline5,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: Sizes.dimen_8.h),
              child: Text(
                description.t(context),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
            if (image != null) image!,
            Button(
              onPressed: () {
                Navigator.pop(context);
              },
              text: TranslationConstants.okay,
            ),
          ],
        ),
      ),
    );
  }
}
