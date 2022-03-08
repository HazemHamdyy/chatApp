import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final Key? key;
  final String? message;
  final String? userName;
  final bool? isMe;

  MessageBubble(this.message, this.userName, this.isMe, {this.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isMe! ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: isMe! ? Colors.grey : Colors.blue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(14),
                topRight: Radius.circular(14),
                bottomLeft: isMe! ? Radius.circular(14):Radius.circular(0),
                bottomRight: isMe! ? Radius.circular(0):Radius.circular(14)
              )),
              padding: EdgeInsets.all(10),
              width: 140,
              margin: EdgeInsets.all(6),
              child: Column(
                crossAxisAlignment: isMe! ? CrossAxisAlignment.end:CrossAxisAlignment.start,
              children: [
                Text(userName!,style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isMe! ? Colors.black : Colors.white,
                ),
                textAlign: isMe! ? TextAlign.end:TextAlign.start,
                ),
                Text(message!,style: TextStyle(
                  color: isMe! ? Colors.black : Colors.white,
                ),
                textAlign: isMe! ? TextAlign.end:TextAlign.start,
                )
              ],
              ),
        )
      ],
    );
  }
}
