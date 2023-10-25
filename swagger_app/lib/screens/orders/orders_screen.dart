import 'package:flutter/material.dart';
import 'package:swagger_app/screens/orders/orders_widget.dart';
import 'package:swagger_app/services/utils.dart';
import 'package:swagger_app/widgets/back_widget.dart';
import 'package:swagger_app/widgets/empty_screen.dart';
import 'package:swagger_app/widgets/text_widget.dart';

class OrdersScreen extends StatefulWidget {
  static const routeName = "/OrdersScreen";
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    Color color = utils.color;
    bool isEmpty = true;
    return isEmpty == true
        ? const EmptyScreen(
            title: 'your cart is empty',
            subtitle: 'Add something and make me happy',
            buttonText: 'Shop now',
            imagePath: 'assets/images/offers/cart.png',
          )
        : Scaffold(
            appBar: AppBar(
              leading: const BackWidget(),
              elevation: 0,
              centerTitle: false,
              title: TextWidget(
                text: 'Your orders',
                color: color,
                textSize: 24.0,
                isTitle: true,
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
                  child: OrdersWidget(),
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
