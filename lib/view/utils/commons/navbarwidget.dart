import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:userinformation/view/utils/constant.dart';

class NavBarWidget extends StatelessWidget {
  int selectedIndex;
  void Function(int)? onItemTapped;

  NavBarWidget({
    Key? key,
    required this.selectedIndex,
    this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      selectedItemColor: primaryColor,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle_rounded),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark_add),
          label: '',
        ),
      ],
    );
  }
}
