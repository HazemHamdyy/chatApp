import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }
  String? messageText;
  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;
  late User signedInUser;

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        signedInUser = user;
        print(signedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  // void getMessages()async{
  //   final messages = await _fireStore.collection('messages').get()
  // }

  // void messagesStream()async{
  //   await for(var snapshot in _fireStore.collection('messages').snapshots()){
  //     snapshot.docs
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[900],
        title: Row(
          children: [
            Image.network(
              'https://res.cloudinary.com/crunchbase-production/image/upload/c_lpad,h_256,w_256,f_auto,q_auto:eco,dpr_1/v1398496368/a6nuf3td70vnk11cd68n.png',
              height: 25,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text('Chat App')
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: _fireStore.collection('messages').snapshots(),
            builder: (context,AsyncSnapshot snapshot){
              List<Text> messagesWidgets = [];
              if(!snapshot.hasData){

              }else{
              final messagess = snapshot.data!.docs;
              for(var message in messagess){
                final messageText = message.get('text');
                final messageSender = message.get('sender');
                final finalMessage = Text('$messageText - $messageSender');
                messagesWidgets.add(finalMessage);}

              }
              return Column(
                children: messagesWidgets,
              );
            }),
          Row(
            children: [
              Expanded(
                  child: TextField(
                onChanged: (value) {
                  messageText = value;
                },
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    hintText: 'Enter Your Message'),
              )),
              IconButton(onPressed: (){
                _fireStore.collection('messages').add({
                  'text': messageText,
                  'sender':signedInUser.email
                });
              }, icon:const Icon(Icons.send))
            ],
          )
        ],
      ),
    );
  }
}
