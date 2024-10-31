import 'package:chat_app/core/utils/colors.dart';
import 'package:chat_app/features/chat/data/models/messages_model.dart';
import 'package:flutter/material.dart';
import '../../../../../constant.dart';

class CustomChatBubble extends StatelessWidget {

  final String message;
  const CustomChatBubble({super.key, required this.message});


  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.only(left: 16,top: 16,bottom: 16,right: 16),
        margin: const EdgeInsets.symmetric(vertical: 16,horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          color: kPrimaryColor,
        ),
        child: Text(
        message,
          style: TextStyle(color: AppColors.white),),
      ),
    );
  }
}



class CustomFriendChatBubble extends StatelessWidget {

  final String message;
  const CustomFriendChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.only(left: 16,top: 16,bottom: 16,right: 16),
        margin: const EdgeInsets.symmetric(vertical: 16,horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
          color: Color(0xff006D84),
        ),
        child: Text(
          message,
          style: TextStyle(color: AppColors.white),),
      ),
    );
  }
}
