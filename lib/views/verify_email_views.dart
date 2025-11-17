import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/constants/routes.dart';

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
            const Text("We've sent you an email verification.Please open it to verify your account"),
            const Text("If you haven't received a verification email yet,press the button below"),
            TextButton(onPressed: ()async{
              final user=FirebaseAuth.instance.currentUser;
              await user?.sendEmailVerification();
            },
            child:const Text('send email verification'),
            ),
            TextButton(onPressed:()async {
             await FirebaseAuth.instance.signOut();
             Navigator.of(context).pushNamedAndRemoveUntil(registerRoute, (route)=>false);
            }, child: const Text('Restart'))
          ],
        ),
    );
  }
}