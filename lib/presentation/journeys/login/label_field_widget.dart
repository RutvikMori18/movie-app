import 'package:flutter/material.dart';
import 'package:movieapp/common/constants/size_constants.dart';
import 'package:movieapp/common/extensions/size_extension.dart';
import 'package:movieapp/presentation/themes/theme_text.dart';

class LabelFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String label, hintText;
  final bool isPassword;
  const LabelFieldWidget(
      {Key? key,
      required this.controller,
      required this.label,
      required this.hintText,
      this.isPassword = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Sizes.dimen_8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.center,
          ),
          TextField(
            obscureText: isPassword,
            obscuringCharacter: '*',
            controller: controller,
            style: Theme.of(context).textTheme.headline6,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: Theme.of(context).textTheme.greySubtitle1,
            ),
          ),
        ],
      ),
    );
  }
}
