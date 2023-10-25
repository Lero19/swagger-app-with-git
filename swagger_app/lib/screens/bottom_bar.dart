import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:swagger_app/provider/dark_theme_provider.dart';
import 'package:swagger_app/screens/cart/cart_screen.dart';
import 'package:swagger_app/screens/categories.dart';
import 'package:swagger_app/screens/home_screen.dart';
import 'package:swagger_app/screens/user.dart';
import 'package:badges/badges.dart' as badges;
import 'package:swagger_app/widgets/text_widget.dart';

class BottomeBarScreen extends StatefulWidget {
  const BottomeBarScreen({super.key});

  @override
  State<BottomeBarScreen> createState() => _BottomeBarScreenState();
}

class _BottomeBarScreenState extends State<BottomeBarScreen> {
  int _selectedIndex = 0;
  final List<Map<String, dynamic>> _pages = [
    {
      'page': const HomeScreen(),
      'title': 'Home Screen',
    },
    {
      'page': CategoriesScreen(),
      'title': 'Categories Screen',
    },
    {
      'page': const CartScreen(),
      'title': 'Cart Screen',
    },
    {
      'page': const UserScreen(),
      'title': 'Profile Screen',
    },
  ];
  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    // ignore: no_leading_underscores_for_local_identifiers
    bool _isDark = themeState.getDarkTheme;
    return Scaffold(
      /*The below commented code can input a nav bar
       on each screen according to the screen name and is of type Map
        */
      // appBar: AppBar(
      //   title: Text(
      //     _pages[_selectedIndex]['title'],
      //   ),
      // ),
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: _isDark ? Theme.of(context).cardColor : Colors.white,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _selectedPage,
        currentIndex: _selectedIndex,
        unselectedItemColor: _isDark ? Colors.white10 : Colors.black38,
        selectedItemColor: _isDark ? Colors.lightBlue.shade200 : Colors.black87,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 0 ? IconlyBold.home : IconlyLight.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 1 ? IconlyBold.category : IconlyLight.category,
            ),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: badges.Badge(
              badgeContent: FittedBox(
                child: TextWidget(
                  text: '1',
                  color: Colors.white,
                  textSize: 15,
                ),
              ),
              badgeStyle: BadgeStyle(
                badgeColor: Colors.blue,
                borderRadius: BorderRadius.circular(8),
                shape: BadgeShape.circle,
              ),
              badgeAnimation: const BadgeAnimation.rotation(
                toAnimate: true,
              ),
              position: BadgePosition.topEnd(
                top: -7,
                end: -7,
              ),
              child: Icon(
                _selectedIndex == 2 ? IconlyBold.buy : IconlyLight.buy,
              ),
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 3 ? IconlyBold.profile : IconlyLight.profile,
            ),
            label: 'User',
          ),
        ],
      ),
    );
  }
}
