import 'package:flutter/material.dart';

class AppBarActions extends StatelessWidget {
  final String title;
  final VoidCallback onLogout;

  const AppBarActions({super.key, required this.title, required this.onLogout});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(child: _buildActionButton(context)),
        IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () {
            showMenu(
              context: context,
              position: const RelativeRect.fromLTRB(100, 90, 0, 0),
              color: Theme.of(context).colorScheme.inversePrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              items: [
                PopupMenuItem(
                  value: 'logout',
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      spacing: 5,
                      children: [Icon(Icons.logout), Text('Logout')],
                    ),
                  ),
                ),
              ],
              elevation: 3.0,
            ).then((value) {
              if (value == 'logout') {
                onLogout();
              }
            });
          },
        ),
      ],
    );
  }

  Widget _buildActionButton(BuildContext context) {
    if (title == "Home") {
      return IconButton(icon: const Icon(Icons.search), onPressed: () {});
    } else if (title == "Profile") {
      return IconButton(icon: const Icon(Icons.person), onPressed: () {});
    } else {
      return const SizedBox.shrink();
    }
  }
}
