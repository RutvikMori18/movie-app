import 'package:flutter/material.dart';
import 'package:movieapp/common/constants/translation_constants.dart';
import 'package:movieapp/common/extensions/size_extension.dart';
import 'package:movieapp/common/extensions/string_extension.dart';
import 'package:movieapp/domain/entities/app_error.dart';
import 'package:wiredash/wiredash.dart';

import '../../../../common/constants/size_constants.dart';
import 'button.dart';

class AppErrorWidget extends StatelessWidget {
  final AppErrorType errorType;
  final Function onPressed;
  const AppErrorWidget(
      {Key? key, required this.errorType, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_20.w),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            errorType == AppErrorType.api
                ? TranslationConstants.somethingWentWrong.t(context)
                : TranslationConstants.checkNetwork.t(context),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          ButtonBar(
            children: [
              Button(
                text: TranslationConstants.retry.t(context),
                onPressed: () => onPressed,
              ),
              Button(
                text: TranslationConstants.feedback.t(context),
                onPressed: () => Wiredash.of(context).show(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
