import 'package:erigo/utils/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({Key? key}) : super(key: key);

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int _selectedIndex = 0;

  List<Widget> tabItems = [
    Center(child: Text('Home')),
    Center(child: Text('Search'),),
    Center(child: Text('Wishlist'),),
    Center(child: Text('Profile'),),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.primaryColor,
      body: Center(
        child: tabItems[_selectedIndex],
      ),
      bottomNavigationBar: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Styles.whiteColor,
        ),
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: SalomonBottomBar(
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: SvgPicture.asset(
                'assets/icons/home-outline-icon.svg',
                color: Styles.blackColor,
              ),
              activeIcon: SvgPicture.asset(
                'assets/icons/home-fill-icon.svg',
                color: Styles.blackColor,
              ),
              title: Text(
                  'Home',
                  style: TextStyle(
                    color: Styles.blackColor,
                  ),
              ),
              selectedColor: Colors.grey,
            ),

            /// Search
            SalomonBottomBarItem(
              icon: SvgPicture.asset(
                'assets/icons/search-outline-icon.svg',
                color: Styles.blackColor,
              ),
              activeIcon: SvgPicture.asset(
                'assets/icons/search-fill-icon.svg',
                color: Styles.blackColor,
              ),
              title: Text(
                'Search',
                style: TextStyle(
                  color: Styles.blackColor,
                ),
              ),
              selectedColor: Colors.grey,
            ),

            /// Wishlist
            SalomonBottomBarItem(
              icon: SvgPicture.asset(
                'assets/icons/heart-outline-icon.svg',
                color: Styles.blackColor,
              ),
              activeIcon: SvgPicture.asset(
                'assets/icons/heart-fill-icon.svg',
                color: Styles.blackColor,
              ),
              title: Text(
                  'Wishlist',
                  style: TextStyle(
                    color: Styles.blackColor,
                  ),
              ),
              selectedColor: Colors.grey,
            ),

            /// Profile
            SalomonBottomBarItem(
              icon: SvgPicture.asset(
                'assets/icons/person-outline-icon.svg',
                color: Styles.blackColor,
              ),
              activeIcon: SvgPicture.asset(
                'assets/icons/person-fill-icon.svg',
                color: Styles.blackColor,
              ),
              title: Text(
                  'Profile',
                  style: TextStyle(
                    color: Styles.blackColor,
                  ),
              ),
              selectedColor: Colors.grey,
            ),
          ],
        )
      ),
    );
  }
}
