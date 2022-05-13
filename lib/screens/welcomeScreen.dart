import 'package:chat_app_2/screens/registrationScreen.dart';
import 'package:chat_app_2/widgets/myButtonWidget.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  Container(
                    height: 100,
                    child: Image.network('https://res.cloudinary.com/crunchbase-production/image/upload/c_lpad,h_256,w_256,f_auto,q_auto:eco,dpr_1/v1398496368/a6nuf3td70vnk11cd68n.png')                  ),
                  const Text(
                    'Chat App',
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),]),
                  const SizedBox(
                    height: 30,
                  ),
                  MyButton(
                    title: 'Sign In',
                    color: Colors.yellow[900],
                    onpressed: () {},
                  ),
                  MyButton(
                      color: Colors.blue[800],
                      onpressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const RegistrationScreen()));
                      },
                      title: 'Sign Up')
                ],
              )
            ),
    );
  }
}

