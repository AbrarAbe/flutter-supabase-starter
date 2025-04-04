import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Text title;
  List<Widget>? actions;
  MyAppbar({super.key, required this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(title: title, actions: actions);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
