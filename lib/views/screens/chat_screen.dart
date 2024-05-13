import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tqnia_chat/controllers/chat_cubit/chat_cubit.dart';
import 'package:tqnia_chat/views/widgets/build_chat_widget/build_text_field_and_button_widget.dart';

import '../../models/message_model.dart';
import '../widgets/build_chat_widget/build_chat_header_widget.dart';
import '../widgets/build_chat_widget/build_chat_widget.dart';
import '../widgets/build_chat_widget/build_loading_icon.dart';

class ChatScreen extends StatelessWidget {
  final List<MessageModel> messages;
  const ChatScreen({super.key, required this.messages});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(messages1: messages, context: context),
      child: const Scaffold(
        resizeToAvoidBottomInset: true,
        body: Column(
          children: [
            BuildChatHeaderWidget(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    BuildChatWidget(),
                    BuildLoadingIcon(),
                    BuildTextFieldAndButtonWidget(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
