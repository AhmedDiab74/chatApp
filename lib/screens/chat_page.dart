import 'package:chat_app/models/messages.dart';
import 'package:chat_app/screens/cubits/chat_cubit/chat_cubit.dart';
import 'package:chat_app/widgets/custom_txtfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants.dart';
import '../widgets/chat_bubble.dart';
import 'login_page.dart';

class ChatPage extends StatelessWidget {
  // List<Message> messageList = [];
  static String id = "ChatPage";
  TextEditingController? controller = TextEditingController();
  final controllerScroll = ScrollController();
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: PGColor,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.message), Text("Chat")],
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: BlocBuilder<ChatCubit, ChatState>(
                builder: (context, state) {
                  var messageList =
                      BlocProvider.of<ChatCubit>(context).messageList;
                  return ListView.builder(
                      reverse: true,
                      controller: controllerScroll,
                      itemCount: messageList.length,
                      itemBuilder: (context, index) {
                        return messageList[index].id == email
                            ? ChatBubble(
                                message: messageList[index],
                              )
                            : ChatBubbleForFriend(
                                message: messageList[index],
                              );
                      });
                },
              ),
            ),
            Container(
                padding: const EdgeInsets.all(16),
                child: CustomTxtFormField(
                  controller: controller,
                  onSubmitted: (data) {
                    BlocProvider.of<ChatCubit>(context)
                        .sendMessage(message: data, email: email);
                    controller!.clear();
                    controllerScroll.animateTo(0,
                        duration: const Duration(seconds: 5), curve: Curves.easeIn);
                  },
                  suffixIcon: Icons.send,
                  colorInput: PGColor,
                  hitText: "Send Message",
                  hinColor: Colors.grey,
                ))
          ],
        ));
  }
}
