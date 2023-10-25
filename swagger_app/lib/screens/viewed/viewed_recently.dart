import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:swagger_app/screens/viewed/viewed_widget.dart';
import 'package:swagger_app/services/global_methods.dart';
import 'package:swagger_app/services/utils.dart';
import 'package:swagger_app/widgets/back_widget.dart';
import 'package:swagger_app/widgets/empty_screen.dart';
import 'package:swagger_app/widgets/text_widget.dart';

class ViewedRecentlyScreen extends StatefulWidget {
  static const routeName = "/ViewedRecentlyScreen";
  const ViewedRecentlyScreen({super.key});

  @override
  State<ViewedRecentlyScreen> createState() => _ViewedRecentlyScreenState();
}

class _ViewedRecentlyScreenState extends State<ViewedRecentlyScreen> {
  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    Color color = utils.color;
    bool isEmpty = true;
    if (isEmpty == true) {
      return const EmptyScreen(
        title: 'your cart is empty',
        subtitle: 'Add something and make me happy',
        buttonText: 'Shop now',
        imagePath: 'assets/images/offers/cart.png',
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                GlobalMethods.warningDialog(
                  title: 'Empty your history?',
                  subtitle: 'are you sure',
                  function: () {},
                  context: context,
                );
              },
              icon: Icon(
                IconlyBroken.delete,
                color: color,
              ),
            ),
          ],
          leading: const BackWidget(),
          automaticallyImplyLeading: false,
          elevation: 0,
          title: TextWidget(
            text: 'History',
            color: color,
            textSize: 24.0,
          ),
          backgroundColor:
              Theme.of(context).scaffoldBackgroundColor.withOpacity(0.9),
        ),
        body: ListView.separated(
          itemCount: 10,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 2,
                vertical: 6,
              ),
              child: ViewedRecentlyWidget(),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              color: color,
              thickness: 1,
            );
          },
        ),
      );
    }
  }
}
