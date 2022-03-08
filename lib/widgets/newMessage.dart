import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({Key? key}) : super(key: key);

  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final _controller = TextEditingController();
  String _enterMessage = '';

  _sendMessage() async{
    FocusScope.of(context).unfocus();
    final user = await FirebaseAuth.instance.currentUser ;
    final userData = await FirebaseFirestore.instance.collection('users').doc(user!.uid).get();
    FirebaseFirestore.instance
        .collection('chat')
        .add({'text': _enterMessage, 'createAt': Timestamp.now(),'userName': userData['username'], 'userId':user.uid});
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
              child: TextField(
            controller: _controller,
            decoration: InputDecoration(labelText: 'Send a Message...'),
            onChanged: (value) {
              setState(() {
                _enterMessage = value;
              });
            },
          )),
          IconButton(
              onPressed: _enterMessage.trim().isEmpty ? null : _sendMessage(),
              icon: Icon(Icons.send))
        ],
      ),
    );
  }
}
