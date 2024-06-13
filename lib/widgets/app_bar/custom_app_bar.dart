import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
          size: 32,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      leadingWidth: 64,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
