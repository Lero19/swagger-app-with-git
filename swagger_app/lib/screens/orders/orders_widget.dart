import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:swagger_app/inner_screens/product_details.dart';
import 'package:swagger_app/services/global_methods.dart';
import 'package:swagger_app/services/utils.dart';
import 'package:swagger_app/widgets/text_widget.dart';

class OrdersWidget extends StatefulWidget {
  const OrdersWidget({Key? key}) : super(key: key);

  @override
  State<OrdersWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrdersWidget> {
  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    Color color = utils.color;
    Size size = Utils(context).getScreenSize;
    return ListTile(
      subtitle: const Text('Paid: R920.00'),
      onTap: () {
        GlobalMethods().navigateTo(
          context: context,
          routeName: ProductDetails.routeName,
        );
      },
      leading: FancyShimmerImage(
        width: size.width * 0.2,
        imageUrl:
            'https://images.unsplash.com/photo-1582142839970-2b9e04b60f65?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1935&q=80',
        boxFit: BoxFit.fill,
      ),
      title: TextWidget(
        text: 'Title  x9',
        color: color,
        textSize: 18,
      ),
      trailing: TextWidget(
        text: '07/11/2023',
        color: color,
        textSize: 18,
      ),
    );
  }
}
