import 'package:flutter/material.dart';
import 'package:movieapp/common/extensions/size_extension.dart';
import 'package:wiredash/wiredash.dart';

import '../../../common/constants/size_constants.dart';
import '../../../common/constants/translation_constants.dart';
import '../../widgets/app_dialog.dart';
import '../../widgets/logo.dart';
import '../favourite/favourite_screen.dart';
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
              title: TranslationConstants.favoriteMovies,
              onTap: () {
                // Navigator.pushNamed(context,RouteList.favourite);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FavouriteScreen(),
                    ));
              },
            ),
            /*TODO : ADD LANGUAGE LIST TILE*/
            // NavigationExpandedListItem(
            //   title: TranslationConstants.language,
            //   onTap: (index) {
            //     BlocProvider.of(context).state;
            //   },
            //   children: Language.languages.map((e) => e.value).toList(),
            // ),
            NavigationListItem(
              title: TranslationConstants.feedback,
              onTap: () {
                Navigator.pop(context);
                Wiredash.of(context).show();
              },
            ),
            NavigationListItem(
              title: TranslationConstants.about,
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
