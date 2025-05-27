import 'package:flutter/material.dart';
import 'package:hapticfone/common/widgets/appbar_customized/appbar_customized.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: []),
      appBar: Appbarcustomized(title: "Chat with us"),
    );
  }
}
