// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_null_in_if_null_operators, sort_child_properties_last

import 'package:exit/config/themes/app_icons.dart';
import 'package:exit/config/themes/custom_text_style.dart';
import 'package:exit/screens/question/test_overview_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? titleWidget;
  final Widget? leading;
  final bool showActionIcon;
  final VoidCallback? onMenuActionTap;
  const CustomAppBar(
      {super.key,
      this.title = '',
      this.titleWidget,
      this.leading,
      this.showActionIcon = false,
      this.onMenuActionTap});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      child: Stack(
        children: [
          Positioned.fill(
            child: titleWidget == null
                ? Center(
                    child: Text(
                      title,
                      style: appBarTS,
                    ),
                  )
                : Center(
                    child: titleWidget,
                  ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              leading ??
                  Transform.translate(
                    offset: Offset(-14, 0),
                    child: BackButton(),
                  ),
              if (showActionIcon)
                Transform.translate(
                  offset: Offset(10, 0),
                  child: InkWell(
                    child: Icon(AppIcons.menu),
                    onTap: onMenuActionTap ??
                        () => Get.toNamed(TestOverviewScreen.routeName),
                  ),
                )
            ],
          )
        ],
      ),
    ));
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 80);
}
