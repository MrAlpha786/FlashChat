import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String text;
  final String sender;
  final bool isCurrentUser;
  final radius = const Radius.circular(30.0);

  const ChatBubble(
      {super.key,
      required this.text,
      required this.sender,
      required this.isCurrentUser});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
          crossAxisAlignment:
              isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              sender,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12.0,
              ),
            ),
            Material(
              color: isCurrentUser ? Colors.deepOrangeAccent : Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: radius,
                bottomRight: radius,
                topLeft: isCurrentUser ? radius : Radius.zero,
                topRight: isCurrentUser ? Radius.zero : radius,
              ),
              elevation: 5.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 20.0,
                ),
                child: Text(
                  text,
                  style: TextStyle(
                    color: isCurrentUser ? Colors.white : Colors.black54,
                    fontSize: 15.0,
                  ),
                ),
              ),
            )
          ]),
    );
  }
}
