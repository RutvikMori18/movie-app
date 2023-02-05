import 'package:flutter/material.dart';
import 'package:movieapp/common/constants/size_constants.dart';
import 'package:movieapp/common/extensions/size_extension.dart';

import '../../widgets/logo.dart';
import 'login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: Sizes.dimen_32.h,
              ),
              child: Logo(height: Sizes.dimen_12.h),
            ),
            const LoginForm(),
          ],
        ),
      ),
    );
  }
}
