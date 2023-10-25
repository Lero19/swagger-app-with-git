import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swagger_app/provider/dark_theme_provider.dart';
import 'package:swagger_app/widgets/text_widget.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    super.key,
    required this.catText,
    required this.imgPath,
    required this.passedColor,
  });

  final String catText, imgPath;
  final Color passedColor;

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    double _screenWidth = MediaQuery.of(context).size.width;
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    return InkWell(
      onTap: () {
        print(
          'Category Pressed',
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: passedColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: passedColor.withOpacity(0.2),
            width: 2,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              height: _screenWidth * 0.3,
              width: _screenWidth * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    imgPath,
                  ),
                  fit: BoxFit.fill,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextWidget(
              text: catText,
              color: color,
              textSize: 20,
              isTitle: true,
            ),
          ],
        ),
      ),
    );
  }
}