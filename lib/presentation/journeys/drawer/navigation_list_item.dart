import 'package:flutter/material.dart';
import 'package:movieapp/common/extensions/size_extension.dart';

import '../../../common/constants/size_constants.dart';

class NavigationListItem extends StatelessWidget {
  final String title;
  final void Function() onTap;
  const NavigationListItem({Key? key, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              color: Theme.of(context).primaryColor.withOpacity(0.5),
            ),
          ],
        ),
        child: ListTile(
          title: Text(
            title,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
      ),
    );
  }
}

class NavigationSubListItem extends StatelessWidget {
  final String title;
  final Function onTap;
  const NavigationSubListItem(
      {Key? key, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap(),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              color: Theme.of(context).primaryColor.withOpacity(0.5),
            ),
          ],
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(
            horizontal: Sizes.dimen_32.w,
          ),
          title: Text(
            title,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
      ),
    );
  }
}
