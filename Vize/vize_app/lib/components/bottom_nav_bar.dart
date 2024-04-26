import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  final void Function(int)? onTabChange;
  const MyBottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black.withOpacity(0.1),
          )
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
            rippleColor: Colors.grey[300]!,
            hoverColor: Colors.grey[100]!,
            gap: 0,
            activeColor: Theme.of(context).colorScheme.primary,
            iconSize: 24,
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
            duration: const Duration(milliseconds: 400),
            tabBackgroundColor:
                Theme.of(context).colorScheme.primary.withAlpha(100),
            color: Colors.black,
            tabs: const [
              GButton(
                icon: Icons.home,
              ),
              GButton(
                icon: Icons.favorite,
              ),
            ],
            onTabChange: onTabChange,
          ),
        ),
      ),
    );
  }
}
