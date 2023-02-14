import 'package:flutter/material.dart';
import 'package:movieapp/presentation/themes/theme_color.dart';
import 'package:wiredash/wiredash.dart';

class WiredashApp extends StatelessWidget {
  final dynamic navigatorKey;
  final Widget child;
  final String languageCode;
  const WiredashApp(
      {Key? key,
      this.navigatorKey,
      required this.child,
      required this.languageCode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wiredash(
      projectId: 'movieapp-ke85tum',
      secret: 'm7YpEEz9IwAeP-J6srzhLvZalfE9qcBi',
      options: WiredashOptionsData(
        locale: Locale.fromSubtags(languageCode: languageCode),
      ),
      theme: WiredashThemeData(
        brightness: Brightness.dark,
        primaryColor: AppTheme.royalBlue,
        secondaryColor: AppTheme.violet,
        secondaryBackgroundColor: AppTheme.vulcan,
      ),
      child: child,
    );
  }
}
