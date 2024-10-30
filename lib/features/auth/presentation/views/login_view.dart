import 'package:chat_app/constant.dart';
import 'package:chat_app/core/utils/app_router.dart';
import 'package:chat_app/core/utils/colors.dart';
import 'package:chat_app/core/utils/styles.dart';
import 'package:chat_app/core/utils/validator.dart';
import 'package:chat_app/core/widgets/custom_button.dart';
import 'package:chat_app/core/widgets/custom_text_form_field.dart';
import 'package:chat_app/core/widgets/dialog.dart';
import 'package:chat_app/features/chat/presentation/views/chat_details_body.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

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
                  type: TextInputType.emailAddress,
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
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      await signIn(context);
                      GoRouter.of(context).pushReplacement(AppRouter.chatDetails);
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
                        GoRouter.of(context).push(AppRouter.signUp);
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


  Future<void> signIn(BuildContext context) async {
    DialogUtils.showLoading(context);
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      DialogUtils.hideLoading(context);
      DialogUtils.showMessage(
          context: context,
          title: "Success",
          content: "Register Successfully.",
          button1Name: "Done",
          button1Function: () {

          });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        DialogUtils.hideLoading(context);
        DialogUtils.showMessage(
          context: context,
          title: "Failed",
          content: "Email or password is incorrect.",
          button1Name: "Retry",
        );
      } else if (e.code == 'user-not-found') {
        DialogUtils.hideLoading(context);
        DialogUtils.showMessage(
          context: context,
          title: "Failed",
          content: "No user found for that email.",
          button1Name: "Retry",
        );
      } else if (e.code == 'wrong-password') {
        DialogUtils.hideLoading(context);
        DialogUtils.showMessage(
          context: context,
          title: "Failed",
          content: "Wrong password provided for that user.",
          button1Name: "Retry",
        );
      } else if (e.code == 'network-request-failed') {
        DialogUtils.hideLoading(context);
        DialogUtils.showMessage(
          context: context,
          title: "Failed",
          content: "Network request failed.",
          button1Name: "Retry",
        );
      }
    } catch (e) {
      DialogUtils.hideLoading(context);
      DialogUtils.showMessage(
        context: context,
        title: "Failed",
        content: "Something went wrong. Please try again.",
        button1Name: "Retry",
      );
    }
  }

}