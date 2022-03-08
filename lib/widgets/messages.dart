import 'package:chat_app/widgets/messageBubble.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chat')
            .orderBy('createAt', descending: true)
            .snapshots(),
        builder: (context,AsyncSnapshot snapShot) {
          if (snapShot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          final docs = snapShot.data!.docs;
          return ListView.builder(
              reverse: true,
              itemCount: docs.length,
              itemBuilder: (context, index) {
                return MessageBubble(
                  docs[index]['text'],
                  'Hazem',
                  true,
                  key: ValueKey('p1'),
                );
              });
        });
  }
}
