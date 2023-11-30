part of 'chat_cubit.dart';

abstract class ChatState {}

final class ChatInitial extends ChatState {}

final class ChatSuccess extends ChatState {
  List<Message> message;
  ChatSuccess({required this.message}); 
}
