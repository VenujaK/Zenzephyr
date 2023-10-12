import 'package:flutter/material.dart';
import 'package:zenzephyr/Utils/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showLogoutButton;
  final Function()? onLogoutPressed;

  CustomAppBar({required this.title, required this.showLogoutButton, this.onLogoutPressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: TextStyle(color: AppColors.primaryColor,fontWeight: FontWeight.w600,fontSize: 16, )),
      iconTheme: IconThemeData(color: AppColors.primaryColor),
      backgroundColor: Colors.transparent,
      shadowColor: Colors.black12,
      bottomOpacity: 0.0,
      elevation: 0.0,
      actions: [
        if (showLogoutButton)
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: onLogoutPressed,
          ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
