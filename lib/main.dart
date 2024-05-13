import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tqnia_chat/app.dart';
import 'package:tqnia_chat/core/utils/database_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DataBaseManager.initHive();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}
