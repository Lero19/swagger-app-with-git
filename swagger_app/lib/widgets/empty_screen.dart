import 'package:flutter/material.dart';
import 'package:swagger_app/inner_screens/feeds_screen.dart';
import 'package:swagger_app/services/global_methods.dart';
import 'package:swagger_app/services/utils.dart';
import 'package:swagger_app/widgets/text_widget.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({
    Key? key,
    required this.imagePath,
    required this.buttonText,
    required this.subtitle,
    required this.title,
  }) : super(key: key);

  final String imagePath, title, subtitle, buttonText;

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    final themeState = Utils(context).getTheme;
    Color color = utils.color;
    Size size = utils.getScreenSize;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Image.asset(
                imagePath,
                width: double.infinity,
                height: size.height * 0.4,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Whoops',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextWidget(
                text: title,
                color: Colors.cyan,
                textSize: 20,
              ),
              const SizedBox(
                height: 20,
              ),
              TextWidget(
                text: subtitle,
                color: Colors.cyan,
                textSize: 20,
              ),
              SizedBox(
                height: size.height * 0.15,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      8.0,
                    ),
                    side: BorderSide(
                      color: color,
                    ),
                  ),
                  primary: Theme.of(context).colorScheme.secondary,
                  onPrimary: color,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 20,
                  ),
                ),
                onPressed: () {
                  GlobalMethods().navigateTo(
                    context: context,
                    routeName: FeedsScreen.routeName,
                  );
                },
                child: TextWidget(
                  text: buttonText,
                  textSize: 20,
                  color: themeState ? Colors.white : Colors.black,
                  isTitle: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
