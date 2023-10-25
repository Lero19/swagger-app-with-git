import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swagger_app/const/theme_data.dart';
import 'package:swagger_app/inner_screens/feeds_screen.dart';
import 'package:swagger_app/inner_screens/on_sale_screen.dart';
import 'package:swagger_app/inner_screens/product_details.dart';
import 'package:swagger_app/provider/dark_theme_provider.dart';
import 'package:swagger_app/providers/product_provider.dart';
import 'package:swagger_app/screens/authentication/forgot_password_screen.dart';
import 'package:swagger_app/screens/authentication/login_screen.dart';
import 'package:swagger_app/screens/authentication/register.dart';
import 'package:swagger_app/screens/bottom_bar.dart';
//import 'package:swagger_app/screens/bottom_bar.dart';
import 'package:swagger_app/screens/orders/orders_screen.dart';
import 'package:swagger_app/screens/viewed/viewed_recently.dart';
import 'package:swagger_app/screens/wishlist/wishlist_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  // This widget is the root of your application.
  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
        await themeChangeProvider.darkThemePrefs.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            return themeChangeProvider;
          },
        ),
        ChangeNotifierProvider(
          create: (_) => ProductsProvider(),
        ),
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: Styles.themeData(themeProvider.getDarkTheme, context),
            home: const BottomeBarScreen(),
            routes: {
              OnSaleScreen.routeName: (context) => const OnSaleScreen(),
              FeedsScreen.routeName: (context) => const FeedsScreen(),
              ProductDetails.routeName: (context) => const ProductDetails(),
              WishlistScreen.routeName: (context) => const WishlistScreen(),
              OrdersScreen.routeName: (context) => const OrdersScreen(),
              ViewedRecentlyScreen.routeName: (context) =>
                  const ViewedRecentlyScreen(),
              RegisterScreen.routeName: (context) => const RegisterScreen(),
              LoginScreen.routeName: (context) => const LoginScreen(),
              ForgotPasswordScreen.routeName: (context) =>
                  const ForgotPasswordScreen(),
            },
          );
        },
      ),
    );
  }
}
