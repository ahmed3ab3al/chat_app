import 'package:chat_app/constant.dart';
import 'package:chat_app/core/utils/colors.dart';
import 'package:chat_app/core/widgets/custom_text_form_field.dart';
import 'package:chat_app/features/chat/data/models/messages_model.dart';
import 'package:chat_app/features/chat/presentation/views/widgets/custom_chat_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatDetailsBody extends StatelessWidget {
  ChatDetailsBody({
    super.key,
    required this.email,
  });
  final String email;
  final TextEditingController customController = TextEditingController();
  final CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy('createdAt', descending: true).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          List<MessagesModel> messagesList = [];
          for (int i = 0; i < snapshot.data.docs.length; i++) {
            messagesList.add(MessagesModel.fromJson(snapshot.data.docs[i]));
          }
          return Scaffold(
            appBar: AppBar(
              backgroundColor: kPrimaryColor,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage("assets/images/scholar.png"),
                    height: 40,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Chat',
                    style: TextStyle(color: AppColors.white, fontSize: 25),
                  )
                ],
              ),
            ),
            body: Column(
              children: [
                Expanded(
                    child: ListView.builder(
                  reverse: true,
                  itemBuilder: (context, index) =>
                      messagesList[index].id == email
                          ? CustomChatBubble(
                              message: messagesList[index].message,
                            )
                          : CustomFriendChatBubble(
                              message: messagesList[index].message,
                            ),
                  itemCount: messagesList.length,
                )),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: CustomTextFormFiled(
                    onFieldSubmitted: (data) {
                      messages.add({
                        'message': data,
                        'createdAt': DateTime.now(),
                        'id': email
                      });
                      customController.clear();
                      scrollController.animateTo(
                        0,
                        // scrollController.position.maxScrollExtent,
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeIn,
                      );
                    },
                    customController: customController,
                    validator: (val) => null,
                    type: TextInputType.text,
                    secure: false,
                    borderRadius: 16,
                    borderColor: kPrimaryColor,
                    cursorColor: kPrimaryColor,
                    inputTextStyle: TextStyle(
                      fontSize: 20,
                      color: kPrimaryColor,
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        messages.add({
                          'message': customController.text,
                          'createdAt': DateTime.now(),
                          'id': email
                        });
                        customController.clear();
                        scrollController.animateTo(
                          0,
                          // scrollController.position.maxScrollExtent,
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeIn,
                        );
                      },
                      child: Icon(
                        Icons.send,
                        color: kPrimaryColor,
                        size: 25,
                      ),
                    ),
                    hint: 'Send Message',
                  ),
                )
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
