import 'package:employee_forums_task/colors.dart';
import 'package:employee_forums_task/providers/bottomNavigationProvider.dart';
import 'package:employee_forums_task/screens/savedPostScreen.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final List<BottomNavigationBarItem> _bottomNavItems = [
    const BottomNavigationBarItem(
      icon: FaIcon(FontAwesomeIcons.houseChimney),
      label: 'Feed',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      label: 'Liked',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.people),
      label: 'Community',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.bookmark),
      label: 'Saved',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomNavigationProvider>(context);

    return BottomNavigationBar(
      currentIndex: provider.currentIndex,
      type: BottomNavigationBarType.fixed,
      backgroundColor: black,
      selectedItemColor: isSelected,
      unselectedItemColor: searchColor,
      items: _bottomNavItems,
      onTap: (index) {
        if (index == 0) {
          Navigator.pushNamed(context, '/');
        } else if (index == 1) {
          Navigator.pushNamed(context, '/liked-posts');
        } else if (index == 3) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SavedPostsScreen()));
        }
      },
    );
  }
}
