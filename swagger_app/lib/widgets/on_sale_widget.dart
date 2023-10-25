import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:swagger_app/Models/products_models.dart';
import 'package:swagger_app/inner_screens/product_details.dart';
import 'package:swagger_app/services/global_methods.dart';
import 'package:swagger_app/services/utils.dart';
import 'package:swagger_app/widgets/heart_btn.dart';
import 'package:swagger_app/widgets/price_widget.dart';
import 'package:swagger_app/widgets/text_widget.dart';

class OnSaleWidget extends StatefulWidget {
  const OnSaleWidget({Key? key}) : super(key: key);

  @override
  State<OnSaleWidget> createState() => _OnSaleWidgetState();
}

class _OnSaleWidgetState extends State<OnSaleWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).color;
    final productModel = Provider.of<ProductModel>(context);

    // Create an instance of GlobalMethods
    //GlobalMethods globalMethods = GlobalMethods();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).cardColor.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            // Call navigateTo on the instance
            GlobalMethods().navigateTo(
              context: context,
              routeName: ProductDetails.routeName,
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //the shimmer package will provide some animation while the images are being fetched
                    FancyShimmerImage(
                      imageUrl:
                          'https://images.unsplash.com/photo-1582142839970-2b9e04b60f65?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1935&q=80',
                      height: size.width * 0.22,
                      width: size.width * 0.22,
                      boxFit: BoxFit.fill,
                    ),
                    Column(
                      children: [
                        TextWidget(
                          text: 'S',
                          color: color,
                          textSize: 15,
                          isTitle: true,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Icon(
                                IconlyLight.bag2,
                                size: 20,
                                color: color,
                              ),
                            ),
                            const HeartButton(),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                PriceWidget(
                  salePrice: productModel.salePrice,
                  price: productModel.price,
                  textPrice: '1',
                  isOnSale: true,
                ),
                const SizedBox(
                  height: 5,
                ),
                TextWidget(
                  text: 'Health',
                  color: color,
                  textSize: 16,
                  isTitle: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
