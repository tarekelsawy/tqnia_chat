// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive_flutter/hive_flutter.dart';
part 'message_model.g.dart';

@HiveType(typeId: 0)
class MessageModel {
  @HiveField(0)
  final String message;

  @HiveField(1)
  final bool isQuestion;

  MessageModel({
    required this.message,  
    required this.isQuestion,
  });
}



@HiveType(typeId: 1)
class ChatMessageList extends HiveObject {
  @HiveField(0)
  List<MessageModel> messages;

  ChatMessageList({required this.messages});
}