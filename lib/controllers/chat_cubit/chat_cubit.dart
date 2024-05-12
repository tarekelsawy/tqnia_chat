import 'package:bloc/bloc.dart';
// import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/material.dart';
import 'package:tqnia_chat/controllers/chat_cubit/chat_states.dart';
import '../../models/message_model.dart';

class ChatCubit extends Cubit<ChatStates> {
  TextEditingController textController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List<MessageModel> messages = [];
  // final _chatGpt = OpenAI.instance.build(
  //     token: oldApi,
  //     baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 5)),
  //     enableLog: true);
  FocusNode focusNode = FocusNode();
  ChatCubit() : super(InitChatState());

  void setQuestionMessage() {
    if (textController.text.isNotEmpty) {
      // focusNode.unfocus();
      debugPrint('message ${textController.text}');

      messages.insert(
          0, MessageModel(message: textController.text, isQuestion: true));
      textController.clear();
      emit(SetQuestionMessageState());
      // sendToChatGPT();
    }
  }

  // Future<void> sendToChatGPT() async {
  //   List<Map<String, dynamic>> historyMessage = messages.reversed.map((e) {
  //     if (e.isQuestion) {
  //       return {"role": "user", "content": e.message};
  //     } else {
  //       return {"role": "assistant", "content": e.message};
  //     }
  //   }).toList();

  //   var request = ChatCompleteText(
  //     model: GptTurbo0301ChatModel(),
  //     messages: historyMessage,
  //     maxToken: 30,
  //   );
  //   var response = await _chatGpt.onChatCompletion(request: request);
  //   for (var element in response!.choices) {
  //     if (element.message != null) {
  //       messages.insert(0,
  //           MessageModel(message: element.message!.content, isQuestion: false));
  //       emit(SetQuestionMessageState());
  //     }
  //   }
  // }

  @override
  Future<void> close() {
    textController.dispose();
    focusNode.dispose();
    return super.close();
  }
}
