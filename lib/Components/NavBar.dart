import 'package:flutter/material.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({@required this.selectedIndex, this.onTap});

  final int selectedIndex;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      // type: BottomNavigationBarType.fixed,
      elevation: 10.0,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.green,
      currentIndex: selectedIndex,
      onTap: onTap,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: 30.0,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
            size: 30.0,
          ),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.shopping_bag,
            size: 30.0,
          ),
          label: 'My Orders',
        ),
      ],
    );
  }
}
