import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //scaffold: El contenedor de todo cuando se trata de una pantalla
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://img.freepik.com/vector-premium/cara-mono-gracioso-dibujos-animados-avatar_6996-1144.jpg'),
          ),
        ),
        title: const Text('Mono loco'),
        centerTitle: false,
      ),
      body: _ChatView()// ctrl + . para crear el widget _ChatView con Container(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}