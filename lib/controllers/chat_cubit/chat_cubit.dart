// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:tqnia_chat/controllers/chat_cubit/chat_states.dart';
import 'package:tqnia_chat/core/utils/database_manager.dart';
import 'package:tqnia_chat/views/widgets/show_dialog.dart';
import '../../constants.dart';
import '../../models/message_model.dart';

class ChatCubit extends Cubit<ChatStates> {
  TextEditingController textController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ScrollController scrollController = ScrollController();
  final List<MessageModel> messages1;
  final BuildContext context;
  List<MessageModel> messages2 = [];
  late ChatSession chat;
  late StreamSubscription<InternetConnectionStatus> listener;
  final model = GenerativeModel(
    model: 'gemini-pro',
    apiKey: apiKey,
    generationConfig: GenerationConfig(maxOutputTokens: 100),
  );
  FocusNode focusNode = FocusNode();

  ChatCubit({required this.context, required this.messages1})
      : super(InitChatState()) {
    checkInternetConnection();
    
  }

  void checkInternetConnection() {
    listener = InternetConnectionChecker().onStatusChange.listen(
      (InternetConnectionStatus status) {
        switch (status) {
          case InternetConnectionStatus.connected:
          chat = model.startChat();
          initChat();
            // ignore: avoid_print
            print('Data connection is available.');
            break;
          case InternetConnectionStatus.disconnected:
            showError(context, 'No Internet Connection');
            break;
        }
      },
    );
  }

  void initChat() {
    List<Content> historyMessage = messages1.reversed.map((e) {
      if (e.isQuestion) {
        return Content.text(e.message);
      } else {
        return Content.model([TextPart(e.message)]);
      }
    }).toList();
    chat = model.startChat(history: historyMessage);
  }

  void setQuestionMessage() {
    if (textController.text.isNotEmpty) {
      // focusNode.unfocus();
      debugPrint('message ${textController.text}');
      // messages2 = List.from(messages1);

      messages1.insert(
          0, MessageModel(message: textController.text, isQuestion: true));
      textController.clear();
      emit(SentUserMessageState());
      sendToChatGPT();
    }
  }

  void scrollDown() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 750),
        curve: Curves.easeOutCirc,
      ),
    );
  }

  Future<void> sendToChatGPT() async {
    emit(SentMessageLoadingState());
    try {
      List<Content> historyMessage = messages2.reversed.map((e) {
        if (e.isQuestion) {
          return Content.text(e.message);
        } else {
          return Content.model([TextPart(e.message)]);
        }
      }).toList();

      // Initialize the chat
      debugPrint('before start chat');
      chat = model.startChat(history: historyMessage);

      var content = Content.text(messages1[0].message);
      debugPrint('before send Message');
      var response = await chat.sendMessage(content);
      debugPrint('after send Message ${messages1[0].message}');
      var text = response.text;
      debugPrint('response.text ${response.text}');
      if (text == null) {
        emit(SentMessageErrorState(message: 'No response from API.'));
        return;
      } else {
        messages1.insert(0, MessageModel(message: text, isQuestion: false));
        messages2 = List.from(messages1);
        emit(SentMessageSuccessState());
        // scrollDown();
      }
    } catch (e) {
      debugPrint('there is an error ${e.toString()}');
      emit(SentMessageErrorState(message: e.toString()));
    } finally {
      focusNode.requestFocus();
    }
  }

  addChatToDatabase() async {
    for (int i = 0; i < messages1.length; ++i) {
      if (messages1[i].isQuestion == false) {
        if (messages1.sublist(i).isNotEmpty) {
          debugPrint(
              'messages1.sublist(i) ${messages1.sublist(i)} ${messages1.sublist(i).length}');
          await DataBaseManager.addChat(messages1.sublist(i));
          break;
        }
      }
    }
  }

  @override
  Future<void> close() async {
    listener.cancel();
    await addChatToDatabase();
    textController.dispose();
    focusNode.dispose();
    scrollController.dispose();
    return super.close();
  }
}
