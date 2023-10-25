import 'package:flutter/material.dart';
import 'package:swagger_app/widgets/text_widget.dart';

class AuthenticationButton extends StatelessWidget {
  const AuthenticationButton({
    super.key,
    required this.function,
    required this.buttonText,
    this.primary = Colors.lightBlue,
  });
  final Function function;
  final String buttonText;
  final Color primary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
        ),
        onPressed: () {
          function();
        },
        child: TextWidget(
          text: buttonText,
          color: Colors.white,
          textSize: 20,
        ),
      ),
    );
  }
}
