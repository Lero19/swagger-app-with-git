import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:swagger_app/const/const.dart';
import 'package:swagger_app/services/utils.dart';
import 'package:swagger_app/widgets/authentication_button.dart';
import 'package:swagger_app/widgets/back_widget.dart';
import 'package:swagger_app/widgets/text_widget.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const routeName = '/ForgotPasswordScreen';
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailTextController = TextEditingController();
  //_isLoading = false;
  @override
  void dispose() {
    _emailTextController.dispose();
    super.dispose();
  }

  void _forgotPasswordFunction() async {}

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    return Scaffold(
      body: Stack(
        children: [
          Swiper(
            itemBuilder: (context, index) {
              return Image.asset(
                Const.authenticationImagesPaths[index],
                fit: BoxFit.cover,
              );
            },
            autoplay: true,
            itemCount: Const.authenticationImagesPaths.length,
          ),
          Container(
            color: Colors.black.withOpacity(
              0.7,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.1,
                ),
                const BackWidget(),
                const SizedBox(
                  height: 20,
                ),
                TextWidget(
                  text: 'Forgot password',
                  color: Colors.white,
                  textSize: 30,
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: _emailTextController,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'email address',
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                AuthenticationButton(
                  function: () {
                    _forgotPasswordFunction();
                  },
                  buttonText: 'Reset now',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
