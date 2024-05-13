import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tqnia_chat/controllers/home_cubit/home_states.dart';
import 'package:tqnia_chat/core/utils/database_manager.dart';
import 'package:tqnia_chat/core/utils/extentions.dart';
import 'package:tqnia_chat/models/message_model.dart';

class HomeCubit extends Cubit<HomeStates> {
  List<ChatMessageList> historyChats = [];

  HomeCubit() : super(InitHomeState()) {
    debugPrint('init HomeCubit');
    initHistory();
  }

  void initHistory() {
    emit(HistoryChatsLoadingState());
    debugPrint('after cubit HistoryChatsLoadingState');
    historyChats = [];
    for (int i = 0; i < DataBaseManager.chatsBox.length; ++i) {
      historyChats.add(DataBaseManager.getChatAt(i));
      debugPrint('history $i ${historyChats[i].messages[0].message}');
    }
    emit(HistoryChatsSuccessState());
    debugPrint('after cubit HistoryChatsSuccessState');
  }

  void deleteChat(int index) {
    historyChats.removeAt(index);
    DataBaseManager.deleteChats(index);
    emit(DeleteChatState());
  }

  void clearChat() {
    historyChats = [];
    DataBaseManager.clearChats();
    emit(ClearChatState());
  }

  void logOut(BuildContext context) {
    DataBaseManager.setIsFirstVisit = true;
    DataBaseManager.clearChats();
    context.goAndReplaceToOnBoarding();
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
