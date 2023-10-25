import 'package:flutter/material.dart';
import 'package:swagger_app/services/utils.dart';
import 'package:swagger_app/widgets/categories_widget.dart';
import 'package:swagger_app/widgets/text_widget.dart';

// ignore: must_be_immutable
class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});

  List<Color> gridColors = [
    Colors.blue,
    Colors.orange,
    Colors.red,
    Colors.green,
    Colors.pink,
    Colors.yellow,
  ];

  List<Map<String, dynamic>> catInfo = [
    {
      'imgPath': 'assets/images/categories/hoodieCategory.jpg',
      'catText': 'Hoodies',
    },
    {
      'imgPath': 'assets/images/categories/dark.jpg',
      'catText': 'Hats',
    },
    {
      'imgPath': 'assets/images/categories/hoodies.jpg',
      'catText': 'Pants',
    },
    {
      'imgPath': 'assets/images/categories/hoodies.jpg',
      'catText': 'Two piece',
    },
    {
      'imgPath': 'assets/images/categories/hoodies.jpg',
      'catText': 'T-shirts',
    },
    {
      'imgPath': 'assets/images/categories/hoodies.jpg',
      'catText': 'Sports',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final utils = Utils(context);
    Color color = utils.color;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: TextWidget(
          text: 'Categories',
          color: color,
          textSize: 20,
          isTitle: true,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 240 / 250,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          children: List.generate(
            6,
            (index) {
              return CategoriesWidget(
                catText: catInfo[index]['catText'],
                imgPath: catInfo[index]['imgPath'],
                passedColor: gridColors[index],
              );
            },
          ),
        ),
      ),
    );
  }
}
