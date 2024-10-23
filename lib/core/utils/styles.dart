import 'package:chat_app/core/utils/colors.dart';
import 'package:flutter/material.dart';

abstract class Styles {
  static TextStyle appTitleTextStyle =   const TextStyle(
      fontSize: 35,
      fontWeight: FontWeight.bold,
      color: AppColors.white,
      fontFamily: 'Pacifico');

  static TextStyle signInTextStyle =  const TextStyle(
      fontSize: 20,
    color: AppColors.white,
  );
  static TextStyle hintTextStyle =   const TextStyle(
      fontSize: 15,
    color: AppColors.white,
  );
  static TextStyle buttonTextStyle =  const TextStyle(
      fontSize: 25,
    color: AppColors.black,
  );
  static TextStyle inputTextStyle =  const TextStyle(
      fontSize: 15,
    color: AppColors.white,
  );  static TextStyle signUpTextStyle =  const TextStyle(
      fontSize: 18,
    color: AppColors.white,
  );
  static TextStyle noHaveAccountTextStyle =   const TextStyle(
    fontSize: 15,
    color: AppColors.white,
  );

}