// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class ChatStates {}

class InitChatState extends ChatStates {}

class SentUserMessageState extends ChatStates {}

class SentMessageLoadingState extends ChatStates {}

class SentMessageSuccessState extends ChatStates {}

class SentMessageErrorState extends ChatStates {
  final String message;
  SentMessageErrorState({
    required this.message,
  });
}
