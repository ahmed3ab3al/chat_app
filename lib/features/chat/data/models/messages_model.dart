import 'package:chat_app/constant.dart';

class MessagesModel {
 final String message;
 final String id;
 MessagesModel( {required this.id,required this.message});



 factory MessagesModel.fromJson(json) {
    return MessagesModel(
      message: json[messageKey],
      id: json['id'],
    );
  }


}