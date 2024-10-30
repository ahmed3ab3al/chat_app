import 'package:chat_app/constant.dart';
import 'package:chat_app/core/widgets/custom_text_form_field.dart';
import 'package:chat_app/features/chat/data/models/messages_model.dart';
import 'package:chat_app/features/chat/presentation/views/widgets/custom_chat_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatDetailsBody extends StatelessWidget {
   ChatDetailsBody({super.key});
  TextEditingController customController = TextEditingController();
  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: messages.get(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if(snapshot.hasData){
          List<MessagesModel> messagesList =[];
          // snapshot.data.docs.forEach((element) {
          //   messagesList.add(MessagesModel.fromJson(element.data()));
          // // });
          // for (var element in snapshot.data.docs) {
          //   messagesList.add(MessagesModel.fromJson(element.data()));
          // }
          for(int i = 0; i < snapshot.data.docs.length; i++){
            messagesList.add(MessagesModel.fromJson(snapshot.data.docs[i]));
          }
          return  Scaffold(
            appBar: AppBar(
              backgroundColor: kPrimaryColor,
              title: const Row(
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
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  )
                ],
              ),
            ),
            body: Column(
              children: [
                Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) => CustomChatBubble(
                    //    message: messagesList[index].message,
                        mess: messagesList[index],
                      ),
                      itemCount: messagesList.length,
                    )),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: CustomTextFormFiled(
                    onFieldSubmitted: (data)
                    {
                      messages.add({
                        'message' : data,
                      });
                      customController.clear();
                    },
                    customController: customController,
                    validator: (val)=>null,
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
                      onTap: (){
                        messages.add({
                          'message' : customController.text,
                        });
                        customController.clear();
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
        }else{
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

      },
    );
  }
}
