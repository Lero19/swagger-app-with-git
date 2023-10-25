import 'package:flutter/material.dart';
//import 'package:swagger_app/services/utils.dart';
import 'package:swagger_app/widgets/text_widget.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({
    super.key,
    required this.salePrice,
    required this.textPrice,
    required this.isOnSale,
    required this.price,
  });

  final double salePrice, price;
  final String textPrice;
  final bool isOnSale;

  @override
  Widget build(BuildContext context) {
    //final Color color = Utils(context).color;
    return FittedBox(
      child: Row(
        children: [
          TextWidget(
            text: 'R200',
            color: Colors.green,
            textSize: 20,
          ),
          const SizedBox(
            width: 5,
          ),
          const Text(
            'R350',
            style: TextStyle(
              fontSize: 15,
              color: Colors.red,
              decoration: TextDecoration.lineThrough,
            ),
          ),
        ],
      ),
    );
  }
}
