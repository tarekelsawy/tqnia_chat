import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tqnia_chat/controllers/chat_cubit/chat_cubit.dart';
import 'package:tqnia_chat/core/utils/styles.dart';
import 'package:tqnia_chat/views/widgets/build_chat_widget/build_text_field_and_button_widget.dart';
import 'package:tqnia_chat/views/widgets/text_widget.dart';

import '../widgets/build_chat_widget/build_chat_header_widget.dart';
import '../widgets/build_chat_widget/build_chat_widget.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(),
      child: const Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              BuildChatHeaderWidget(),
              BuildChatWidget(),
              BuildTextFieldAndButtonWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
