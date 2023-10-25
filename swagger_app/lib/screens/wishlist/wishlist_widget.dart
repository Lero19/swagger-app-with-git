import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:swagger_app/inner_screens/product_details.dart';
import 'package:swagger_app/services/global_methods.dart';
import 'package:swagger_app/services/utils.dart';
import 'package:swagger_app/widgets/heart_btn.dart';
import 'package:swagger_app/widgets/text_widget.dart';

class WishlistWidget extends StatelessWidget {
  const WishlistWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    Color color = utils.color;
    Size size = Utils(context).getScreenSize;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: () {
          GlobalMethods().navigateTo(
            context: context,
            routeName: ProductDetails.routeName,
          );
        },
        child: Container(
          height: size.height * 0.20,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            border: Border.all(color: color, width: 1),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 8.0),
                width: size.width * 0.2,
                height: size.width * 0.25,
                child: FancyShimmerImage(
                  imageUrl:
                      'https://images.unsplash.com/photo-1582142839970-2b9e04b60f65?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1935&q=80',
                  boxFit: BoxFit.fill,
                ),
              ),
              Column(
                children: [
                  Flexible(
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            IconlyLight.bag2,
                            color: color,
                          ),
                        ),
                        const HeartButton(),
                      ],
                    ),
                  ),
                  Flexible(
                    child: TextWidget(
                      text: 'Title',
                      color: color,
                      textSize: 20,
                      maxLines: 2,
                      isTitle: true,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextWidget(
                    text: 'R50',
                    color: color,
                    textSize: 20,
                    maxLines: 1,
                    isTitle: true,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
