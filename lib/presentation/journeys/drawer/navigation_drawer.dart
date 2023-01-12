import 'package:flutter/material.dart';
import 'package:movieapp/common/extensions/size_extension.dart';
import 'package:movieapp/presentation/widgets/logo.dart';

import '../../../common/constants/size_constants.dart';
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
              title: 'Favourite Movies',
              onTap: () {},
            ),
            NavigationExpandedListItem(
              title: 'Language',
              onTap: () {},
              children: const ['English', 'hindi'],
            ),
            NavigationListItem(
              title: 'Feedback',
              onTap: () {},
            ),
            NavigationListItem(
              title: 'About',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
