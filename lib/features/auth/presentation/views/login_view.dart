import 'package:chat_app/constant.dart';
import 'package:chat_app/core/utils/colors.dart';
import 'package:chat_app/core/utils/styles.dart';
import 'package:chat_app/core/utils/validator.dart';
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
      backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 110, left: 20, right: 20),
          child: Form(
            key: formKey,
            child: Column(
              children:[
                const Image(image: AssetImage("assets/images/scholar.png")),
                const SizedBox(
                  height: 10,
                ),
                 Text(
                  'Scholar Chat',
                  style:Styles.appTitleTextStyle
                ),
                const SizedBox(
                  height: 80,
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Sign In',
                      style: Styles.signInTextStyle,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormFiled(
                  validator: (val) => AppValidators.validateEmail(emailController.text),

                  customController: emailController,
                  cursorColor: AppColors.white,
                  borderRadius: 10,
                  hintTextStyle:
                     Styles.hintTextStyle,
                  borderColor: Colors.white,
                  inputTextStyle:Styles.inputTextStyle,
                  hint: 'Email',
                  type: TextInputType.text,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormFiled(
                  validator: (val) => AppValidators.validatePassword(passwordController.text),
                  customController: passwordController,
                  cursorColor: AppColors.white,
                  borderRadius: 10,
                  hintTextStyle:
                  Styles.hintTextStyle,
                  borderColor: AppColors.white,
                  inputTextStyle: Styles.inputTextStyle,
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
                  text: 'Sign In',
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                    }

                  },
                  containerHeight: 50,
                  buttonColor: Colors.white,
                  radius: 10,
                  textStyle: Styles.buttonTextStyle
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Text(
                      'Don\'t have an account ?',
                      style:Styles.noHaveAccountTextStyle
                    ),
                    GestureDetector(
                      onTap: () {
                      },
                      child:  Text(
                        ' Sign Up',
                        style: Styles.signUpTextStyle
                      ),
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