import 'package:flutter/material.dart';
import 'package:swagger_app/widgets/text_widget.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blueGrey,
      child: InkWell(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              height: 50,
              child: Image.asset(
                'assets/images/landing/google.jpg',
                width: 40,
              ),
            ),
            const SizedBox(
              width: 50,
            ),
            TextWidget(
              text: 'Sign up with google',
              color: Colors.white,
              textSize: 18,
            ),
          ],
        ),
      ),
    );
  }
}
