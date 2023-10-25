import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:swagger_app/screens/wishlist/wishlist_widget.dart';
import 'package:swagger_app/services/global_methods.dart';
import 'package:swagger_app/services/utils.dart';
import 'package:swagger_app/widgets/back_widget.dart';
import 'package:swagger_app/widgets/empty_screen.dart';
import 'package:swagger_app/widgets/text_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class WishlistScreen extends StatelessWidget {
  static const routeName = "/WishlistScreen";
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    Color color = utils.color;
    bool isEmpty = true;
    return isEmpty
        ? const EmptyScreen(
            title: 'your wishlist is empty',
            subtitle: 'Explore more and shortlist some items',
            buttonText: 'Add wish',
            imagePath: 'assets/images/offers/cart.png',
          )
        : Scaffold(
            appBar: AppBar(
              centerTitle: true,
              leading: const BackWidget(),
              automaticallyImplyLeading: false,
              elevation: 0,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              title: TextWidget(
                text: 'Wishlist (2)',
                color: color,
                textSize: 22,
                isTitle: true,
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    GlobalMethods.warningDialog(
                      title: 'Remove wishlist',
                      subtitle:
                          'Are you sure you want to remove your wishlist?',
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
            ),
            body: MasonryGridView.count(
              crossAxisCount: 2,
              itemBuilder: (context, index) {
                return const WishlistWidget();
              },
            ),
          );
  }
}
