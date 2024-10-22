import 'package:chat_app/core/utils/colors.dart';
import 'package:chat_app/core/utils/styles.dart';
import 'package:chat_app/core/widgets/custom_button.dart';
import 'package:chat_app/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool secure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2B475E),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 110, left: 20, right: 20),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                const Image(image: AssetImage("assets/images/scholar.png")),
                const SizedBox(
                  height: 10,
                ),
                Text('Scholar Chat', style: Styles.appTitleTextStyle),
                const SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Register',
                      style: Styles.signInTextStyle,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormFiled(
                  customController: passwordController,
                  cursorColor: AppColors.white,
                  borderRadius: 10,
                  hintTextStyle: Styles.hintTextStyle,
                  borderColor: Colors.white,
                  inputTextStyle: Styles.inputTextStyle,
                  textValidator: 'Enter correct Email',
                  hint: 'Email',
                  type: TextInputType.text,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormFiled(
                  customController: passwordController,
                  cursorColor: AppColors.white,
                  borderRadius: 10,
                  hintTextStyle: Styles.hintTextStyle,
                  borderColor: AppColors.white,
                  inputTextStyle: Styles.inputTextStyle,
                  textValidator: 'Enter correct password',
                  hint: 'Password',
                  secure: secure,
                  type: TextInputType.visiblePassword,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        secure = !secure;
                      });
                    },
                    icon: Icon(secure ? Icons.visibility_off : Icons.visibility,
                        color: AppColors.white, size: 25),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                    text: 'REGISTER',
                    onTap: () {
                      if (formKey.currentState!.validate()) {}
                    },
                    containerHeight: 50,
                    buttonColor: Colors.white,
                    radius: 10,
                    textStyle: Styles.buttonTextStyle),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('already have an account ?',
                        style: Styles.noHaveAccountTextStyle),
                    GestureDetector(
                      onTap: () {},
                      child: Text(' Login', style: Styles.signUpTextStyle),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
