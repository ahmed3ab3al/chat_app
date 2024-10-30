import 'package:chat_app/constant.dart';

class MessagesModel {
 final String message;
 MessagesModel({required this.message});

  factory MessagesModel.fromJson(json) {
    return MessagesModel(
      message: json[messageKey],
    );
  }

}