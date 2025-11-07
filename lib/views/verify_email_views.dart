import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class verifyEmailview extends StatefulWidget {
  const verifyEmailview({super.key});

  @override
  State<verifyEmailview> createState() => _verifyEmailviewState();
}

class _verifyEmailviewState extends State<verifyEmailview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Verify email'),backgroundColor: Colors.blue,),
      body: Column(
          children: [
            const Text('Please verify your email address:'),
            TextButton(onPressed: ()async{
              final user=FirebaseAuth.instance.currentUser;
              await user?.sendEmailVerification();
            },
            child:const Text('send email verification'),
            )
          ],
        ),
    );
  }
}