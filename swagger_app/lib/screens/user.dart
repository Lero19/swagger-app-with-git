import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:swagger_app/provider/dark_theme_provider.dart';
import 'package:swagger_app/screens/orders/orders_screen.dart';
import 'package:swagger_app/screens/viewed/viewed_recently.dart';
import 'package:swagger_app/screens/wishlist/wishlist_screen.dart';
import 'package:swagger_app/services/global_methods.dart';
import 'package:swagger_app/widgets/text_widget.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController _addressTextController =
      TextEditingController(text: "");
  @override
  void dispose() {
    super.dispose();
    _addressTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 15,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Hi,  ',
                    style: const TextStyle(
                      color: Colors.cyan,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'MyName',
                        style: TextStyle(
                          color: color,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextWidget(
                  text: 'email@gmail.com',
                  color: color,
                  textSize: 18,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  thickness: 2,
                ),
                const SizedBox(
                  height: 20,
                ),
                SwitchListTile(
                  title: TextWidget(
                    text: 'Theme',
                    color: color,
                    textSize: 18,
                  ),
                  secondary: Icon(themeState.getDarkTheme
                      ? Icons.dark_mode_outlined
                      : Icons.light_mode_outlined),
                  onChanged: (bool value) {
                    setState(() {
                      themeState.setDarkTheme = value;
                    });
                  },
                  value: themeState.getDarkTheme,
                  activeColor: themeState.getDarkTheme
                      ? Colors.lightBlue
                      : Colors.grey, // Change the slider color here
                ),
                _listTiles(
                    title: 'Address',
                    subtitle: 'my subtitle',
                    icon: IconlyLight.profile,
                    onPressed: () async {
                      await _showAddressDialog();
                    },
                    color: color),
                _listTiles(
                  title: 'Orders',
                  icon: IconlyLight.bag,
                  onPressed: () {
                    GlobalMethods().navigateTo(
                      context: context,
                      routeName: OrdersScreen.routeName,
                    );
                  },
                  color: color,
                ),
                _listTiles(
                  title: 'Wishlist',
                  icon: IconlyLight.heart,
                  onPressed: () {
                    GlobalMethods().navigateTo(
                      context: context,
                      routeName: WishlistScreen.routeName,
                    );
                  },
                  color: color,
                ),
                _listTiles(
                  title: 'Forgot password',
                  icon: IconlyLight.unlock,
                  onPressed: () {},
                  color: color,
                ),
                _listTiles(
                  title: 'Viewed',
                  icon: IconlyLight.show,
                  onPressed: () {
                    GlobalMethods().navigateTo(
                      context: context,
                      routeName: ViewedRecentlyScreen.routeName,
                    );
                  },
                  color: color,
                ),
                _listTiles(
                  title: 'Logout',
                  icon: IconlyBold.logout,
                  onPressed: () {
                    GlobalMethods.warningDialog(
                      title: 'Sign out',
                      subtitle: 'Do you want to sign out',
                      function: () {},
                      context: context,
                    );
                  },
                  color: color,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showAddressDialog() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Update'),
            content: TextField(
              // onChanged: (value) {
              //   // _addressTextController.text;
              // },
              controller: _addressTextController,
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: 'Your address',
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Update',
                ),
              ),
            ],
          );
        });
  }

  Widget _listTiles({
    required String title,
    String? subtitle,
    required IconData icon,
    required Function onPressed,
    required Color color,
  }) {
    return ListTile(
      title: TextWidget(
        color: color,
        text: title,
        textSize: 22,
        //isTitle: true,
      ),
      subtitle: TextWidget(
        color: color,
        text: subtitle ?? '',
        textSize: 18,
      ),
      leading: Icon(icon),
      trailing: const Icon(IconlyLight.arrowRight2),
      onTap: () {
        onPressed();
      },
    );
  }
}
