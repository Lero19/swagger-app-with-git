import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:swagger_app/Models/products_models.dart';
import 'package:swagger_app/const/const.dart';
import 'package:swagger_app/inner_screens/feeds_screen.dart';
import 'package:swagger_app/inner_screens/on_sale_screen.dart';
import 'package:swagger_app/providers/product_provider.dart';
import 'package:swagger_app/services/global_methods.dart';
//import 'package:provider/provider.dart';
//import 'package:swagger_app/provider/dark_theme_provider.dart';
import 'package:swagger_app/services/utils.dart';
import 'package:swagger_app/widgets/feed_items.dart';
import 'package:swagger_app/widgets/on_sale_widget.dart';
import 'package:swagger_app/widgets/text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    //final themeState = utils.getTheme;
    Color color = utils.color;
    Size size = Utils(context).getScreenSize;
    GlobalMethods globalMethods = GlobalMethods();
    final productProviders = Provider.of<ProductsProvider>(context);
    List<ProductModel> allProducts = productProviders.getProducts;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.50,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(
                    Const.offerImages[index],
                    fit: BoxFit.fill,
                  );
                },
                autoplay: true,
                itemCount: Const.offerImages.length,
                pagination: const SwiperPagination(
                  alignment: Alignment.bottomCenter,
                  builder: DotSwiperPaginationBuilder(
                    color: Colors.white,
                    activeColor: Colors.red,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            TextButton(
              onPressed: () {
                globalMethods.navigateTo(
                    context: context, routeName: OnSaleScreen.routeName);
              },
              child: TextWidget(
                text: 'View all',
                color: Colors.blue,
                textSize: 20,
                maxLines: 1,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Row(
              children: [
                RotatedBox(
                  quarterTurns: -1,
                  child: Row(
                    children: [
                      TextWidget(
                        text: 'On sale'.toUpperCase(),
                        color: Colors.red,
                        textSize: 20,
                        isTitle: true,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Icon(
                        IconlyLight.discount,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: SizedBox(
                    height: size.height * 0.24,
                    child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return const OnSaleWidget();
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    text: 'Our products',
                    color: color,
                    textSize: 22,
                  ),
                  //const Spacer(),
                  TextButton(
                    onPressed: () {
                      globalMethods.navigateTo(
                        context: context,
                        routeName: FeedsScreen.routeName,
                      );
                    },
                    child: TextWidget(
                      text: 'Browse all',
                      color: Colors.blue,
                      textSize: 20,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              padding: EdgeInsets.zero,
              //crossAxisSpacing: 10,
              childAspectRatio: size.width / (size.height * 0.59),
              children: List.generate(
                allProducts.length < 4 ? allProducts.length : 4,
                (index) {
                  return ChangeNotifierProvider.value(
                    value: allProducts[index],
                    child: const FeedsWidget(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
