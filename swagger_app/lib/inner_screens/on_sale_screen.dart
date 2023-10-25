import 'package:flutter/material.dart';
import 'package:swagger_app/services/utils.dart';
import 'package:swagger_app/widgets/back_widget.dart';
import 'package:swagger_app/widgets/on_sale_widget.dart';
import 'package:swagger_app/widgets/text_widget.dart';

class OnSaleScreen extends StatelessWidget {
  static const routeName = "/OnSaleScreen";
  const OnSaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    bool isEmpty = false;
    //final themeState = utils.getTheme;
    Color color = utils.color;
    Size size = Utils(context).getScreenSize;
    return Scaffold(
      appBar: AppBar(
        leading: const BackWidget(),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: TextWidget(
          text: 'Product on sale',
          color: color,
          textSize: 24,
          isTitle: true,
        ),
      ),
      body: isEmpty
          ?
          // ignore: dead_code
          Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Image.asset('assets/images/offers/empty.jpg'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'No products on sale yet, \nStay tuned',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: color,
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            )
          : GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.zero,
              //crossAxisSpacing: 10,
              childAspectRatio: size.width / (size.height * 0.45),
              children: List.generate(16, (index) {
                return const OnSaleWidget();
              }),
            ),
    );
  }
}
