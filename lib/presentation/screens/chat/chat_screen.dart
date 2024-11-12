import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/main.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/his_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

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
    
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea( //Para que no se oculte el contenido por la barra de notificaciones
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            //builder: en tiempo de ejecucion
            Expanded(child: ListView.builder(
              itemCount: chatProvider.messages.length,
              itemBuilder: (context, index) {
                final message = chatProvider.messages[index];
              return (message.fromWho == FRomWho.me) ? MyMessageBubble(message:message) : const HisMessageBubble();
            },)),
            
            const MessageFieldBox(),
          ],
        ),
      ),
    );
  }
}