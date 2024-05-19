
import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../model/ChatMessage.dart';
import 'chat_input_field01.dart';
import 'message01.dart';


class Body01 extends StatelessWidget {
  const Body01({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: ListView.builder(
              itemCount: demeChatMessages.length,
              itemBuilder: (context, index) =>
                  Message01(message: demeChatMessages[index]),
            ),
          ),
        ),
        const ChatInputField01(),
      ],
    );
  }
}

