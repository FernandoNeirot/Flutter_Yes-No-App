enum FRomWho { me, her}

class Message {
  final String text;
  final String? imageUrl;
  final FRomWho fromWho;

  Message({
    required this.text,
    this.imageUrl,
    required this.fromWho
  });
}