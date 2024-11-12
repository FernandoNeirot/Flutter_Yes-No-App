import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messageList = [
    Message(text: "Hola", fromWho: FRomWho.me),
    Message(text: "Como estas?", fromWho: FRomWho.me),
  ];

  Future<void> sendMessage(String text) async {
    final newMessage = Message(text: text, fromWho: FRomWho.me);
    messageList.add(newMessage);
    notifyListeners();
  }
}
