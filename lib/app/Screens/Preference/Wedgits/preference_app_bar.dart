import 'package:flutter/material.dart';

/// [PreferenceAppBar] builds the app bar for the [PreferenceScreen].
class PreferenceAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PreferenceAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Preferences',
        style: TextStyle(),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }
}