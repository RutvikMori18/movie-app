import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/common/constants/size_constants.dart';
import 'package:movieapp/common/constants/translation_constants.dart';
import 'package:movieapp/common/extensions/size_extension.dart';
import 'package:movieapp/common/extensions/string_extension.dart';
import 'package:movieapp/presentation/blocs/login/login_bloc.dart';
import 'package:movieapp/presentation/themes/theme_text.dart';

import '../../../common/constants/route_constants.dart';
import '../../widgets/button.dart';
import 'label_field_widget.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController userNameController, passwordController;
  bool enableSignIn = false;
  @override
  void initState() {
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    userNameController.addListener(() {
      setState(() {
        enableSignIn = userNameController.text.isNotEmpty &&
            passwordController.text.isNotEmpty;
      });
    });
    passwordController.addListener(() {
      setState(() {
        enableSignIn = userNameController.text.isNotEmpty &&
            passwordController.text.isNotEmpty;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    userNameController.clear();
    passwordController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Sizes.dimen_32.w, vertical: Sizes.dimen_20.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: Sizes.dimen_8.h),
              child: Text(
                TranslationConstants.loginToMovieApp.t(context),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            LabelFieldWidget(
              label: TranslationConstants.username.t(context),
              hintText: TranslationConstants.enterTMDbUsername.t(context),
              controller: userNameController,
            ),
            LabelFieldWidget(
                label: TranslationConstants.password.t(context),
                hintText: TranslationConstants.enterPassword.t(context),
                controller: passwordController,
                isPassword: true),
            BlocConsumer<LoginBloc, LoginState>(
              buildWhen: (previous, current) => current is LoginError,
              listenWhen: (previous, current) => current is LoginSuccess,
              listener: (context, state) {
                Navigator.pushNamedAndRemoveUntil(
                    context, RouteList.home, (route) => false);
              },
              builder: (context, state) {
                if (state is LoginError) {
                  return Text(
                    state.message.t(context),
                    style: Theme.of(context).textTheme.orangeSubtitle1,
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            Button(
              text: TranslationConstants.signIn,
              onPressed: enableSignIn
                  ? () {
                      BlocProvider.of<LoginBloc>(context).add(
                          LoginInitiateEvent(
                              username: userNameController.text,
                              password: passwordController.text));
                    }
                  : null,
              isEnable: enableSignIn,
            ),
          ],
        ),
      ),
    );
  }
}
