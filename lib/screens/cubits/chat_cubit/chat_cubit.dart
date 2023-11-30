import 'package:bloc/bloc.dart';
import 'package:chat_app/constants.dart';
import 'package:chat_app/models/messages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  CollectionReference messages =
      FirebaseFirestore.instance.collection(KMessageCollextion);
  List<Message> messageList = [];

  void sendMessage({required String message, required String email}) {
    messages.add({KMessage: message, KCreatedAt: DateTime.now(), "id": email});
  }

  void getMessages() {
    messages.orderBy(KCreatedAt, descending: true).snapshots().listen((event) {
      messageList.clear();
      for (var doc in event.docs) {
        messageList.add(Message.fromJson(doc));
      }
      emit(ChatSuccess(message: messageList));
    });
  }
}
