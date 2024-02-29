// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, deprecated_member_use, unused_element

import 'package:exit/config/themes/app_colors.dart';
import 'package:exit/controllers/My_zoom_drawer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMenuScreen extends GetView<MyZoomDrawerController> {
  const MyMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      width: double.maxFinite,
      decoration: BoxDecoration(gradient: mainGradient()),
      child: Theme(
          data: ThemeData(
              textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(primary: onSurfaceTextColor))),
          child: SafeArea(
              child: Stack(
            children: [
              Positioned(
                  top: 0,
                  right: 40,
                  child: GestureDetector(
                    onTap: () {
                      controller.toogleDrawer();
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: Colors.white,
                    ),
                  )),
              Column(
                children: [
                  Obx(() => controller.user.value == null
                      ? const SizedBox()
                      : Padding(
                          padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 50,
                                backgroundColor:
                                    const Color.fromARGB(255, 167, 215, 255),
                                backgroundImage:
                                    controller.user.value!.photoURL != null
                                        ? NetworkImage(
                                            controller.user.value!.photoURL!)
                                        : null,
                                child: controller.user.value!.photoURL == null
                                    ? Text(
                                        controller.user.value!.displayName!
                                            .substring(0, 1),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 40,
                                        ),
                                      )
                                    : null,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                controller.user.value!.displayName ?? "",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 18,
                                    color: onSurfaceTextColor),
                              ),
                            ],
                          ),
                        )),
                  const Spacer(
                    flex: 1,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _DrawerButtons(
                        icon: Icons.web_outlined,
                        label: "Website",
                        onPressed: () => controller.website(),
                      ),
                      _DrawerButtons(
                        icon: Icons.email_outlined,
                        label: "Email",
                        onPressed: () => controller.email(),
                      ),
                    ],
                  ),
                  Spacer(
                    flex: 4,
                  ),
                  _DrawerButtons(
                    icon: Icons.logout_outlined,
                    label: "Sign Out",
                    onPressed: () => controller.signOut(),
                  ),
                ],
              )
            ],
          ))),
    );
  }
}

class _DrawerButtons extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onPressed;
  const _DrawerButtons(
      {super.key, required this.icon, required this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: 20,
        ),
        label: Text(label));
  }
}
