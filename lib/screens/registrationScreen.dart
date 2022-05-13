import 'package:chat_app_2/screens/chatScreen.dart';
import 'package:chat_app_2/widgets/myButtonWidget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;

  late String email;
  late String Password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                height: 180,
                child: Image.network(
                    'https://res.cloudinary.com/crunchbase-production/image/upload/c_lpad,h_256,w_256,f_auto,q_auto:eco,dpr_1/v1398496368/a6nuf3td70vnk11cd68n.png')),
            const SizedBox(
              height: 50,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                email = value;
              },
              decoration: const InputDecoration(
                hintText: 'Enter Your Email',
                contentPadding: EdgeInsets.all(15),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.orange,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            TextField(
              obscureText: true,
              onChanged: (value) {
                Password = value;
              },
              decoration: const InputDecoration(
                hintText: 'Enter Your Password',
                contentPadding: EdgeInsets.all(15),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.orange,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            MyButton(
                color: Colors.blue,
                onpressed: () async {
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: Password);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const ChatScreen()));
                        
                  } catch (e) {
                    print(e);
                  }
                },
                title: 'Sign Up')
          ],
        ),
      ),
    );
  }
}
