import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/common/extensions/size_extension.dart';
import 'package:movieapp/common/extensions/string_extension.dart';
import 'package:wiredash/wiredash.dart';

import '../../../common/constants/language.dart';
import '../../../common/constants/route_constants.dart';
import '../../../common/constants/size_constants.dart';
import '../../../common/constants/translation_constants.dart';
import '../../widgets/app_dialog.dart';
import '../../widgets/logourite_screen.dart';
import 'navigation_expansion_list_items.dart';
import 'navigation_list_item.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Sizes.dimen_300.w,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: Theme.of(context).primaryColor.withOpacity(0.5),
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: Sizes.dimen_8.h,
                left: Sizes.dimen_8.w,
                right: Sizes.dimen_8.h,
                bottom: Sizes.dimen_18.w,
              ),
              child: Logo(height: Sizes.dimen_20.h),
            ),
            NavigationListItem(
              title: TranslationConstants.favoriteMovies.t(context),
              onTap: () {
                Navigator.pushNamed(RouteList.favourite);
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => const FavouriteScreen(),
                //     ));
              },
            ),
            NavigationExpandedListItem(
              title: TranslationConstants.language.t(context),
              onTap: (index) {
                BlocProvider.of(context).state;
              },
              children: Language.languages.map((e) => e.value).toList(),
            ),
            NavigationListItem(
              title: TranslationConstants.feedback.t(context),
              onTap: () {
                Navigator.pop(context);
                Wiredash.of(context).show();
              },
            ),
            NavigationListItem(
              title: TranslationConstants.about.t(context),
              onTap: () {
                Navigator.of(context).pop();
                _showDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AppDialog(
            title: TranslationConstants.about,
            description: TranslationConstants.aboutDescription,
            buttonText: TranslationConstants.okay,
            image: Image.asset(
              'assets/pngs/tmdb_logo.png',
              height: Sizes.dimen_32.h,
            ),
          );
        });
  }
}
