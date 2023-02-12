import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/common/constants/size_constants.dart';
import 'package:movieapp/common/extensions/size_extension.dart';
import 'package:movieapp/presentation/journeys/loading/loading_circle.dart';
import 'package:movieapp/presentation/themes/theme_color.dart';

import '../../blocs/loading/loading_bloc.dart';

class LoadingScreen extends StatefulWidget {
  final Widget screen;

  const LoadingScreen({Key? key, required this.screen}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoadingBloc, LoadingState>(
      builder: (context, state) {
        return Stack(
          fit: StackFit.expand,
          children: [
            widget.screen,
            if (state is LoadingStartedState)
              Container(
                decoration: BoxDecoration(
                  color: AppTheme.vulcan.withOpacity(0.8),
                ),
                child: Center(
                    child: LoadingCircle(
                  size: Sizes.dimen_200.w,
                )),
              ),
          ],
        );
      },
    );
  }
}
