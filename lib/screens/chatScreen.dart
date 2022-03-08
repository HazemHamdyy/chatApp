import 'package:chat_app/widgets/messages.dart';
import 'package:chat_app/widgets/newMessage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Expanded(child: Messages()),
        NewMessage(),
        ],
      ),
    );
  }
}
