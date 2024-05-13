import 'package:hive_flutter/hive_flutter.dart';
import 'package:tqnia_chat/models/message_model.dart';

class DataBaseManager {
  //Documents directory for saving our database
  static late Box chatsBox;
  static late Box isFirstVisitBox;

  static Future initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(MessageModelAdapter());
    Hive.registerAdapter(ChatMessageListAdapter());
    chatsBox = await Hive.openBox<ChatMessageList>('chatsBox');
    isFirstVisitBox = await Hive.openBox('isFirstVisitBox');

    // purchaseBox.put('isUnitsDownloaded', false);//for only test
    // purchaseBox.put('isUnitsPurchased', false);//for only test
  }

  static bool get isFirstVisit =>
      isFirstVisitBox.get('isFirstVisit', defaultValue: true);

  static set setIsFirstVisit(bool isFirstVisit) =>
      isFirstVisitBox.put('isFirstVisit', isFirstVisit);

  static ChatMessageList getChatAt(int index) {
    return chatsBox.getAt(index);
  }

  static Future<void> addChat(List<MessageModel> messages)async {
    ChatMessageList chat = ChatMessageList(messages: messages);
    chatsBox.add(chat);
  }

  static deleteChats(int index) {
    chatsBox.deleteAt(index);
  }

  static clearChats() {
    chatsBox.clear();
  }
}
