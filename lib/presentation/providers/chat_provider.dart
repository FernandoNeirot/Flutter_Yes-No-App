import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();
  final getYesNoMessage = GetYesNoAnswer();
  List<Message> messageList = [
    Message(text: "Hola", fromWho: FRomWho.me),
    Message(text: "Como estas?", fromWho: FRomWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FRomWho.me);
    messageList.add(newMessage);
    if (text.endsWith("?")) {
      herRelay();
    }
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> herRelay() async {
    final herMessage = await getYesNoMessage.getAnswer();
    messageList.add(herMessage);
    notifyListeners();
    moveScrollToBottom();
  }

  void moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
