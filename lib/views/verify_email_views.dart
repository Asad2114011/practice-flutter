import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotes/services/auth/bloc/auth_bloc.dart';
import 'package:mynotes/services/auth/bloc/auth_event.dart';

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
            TextButton(onPressed: (){
              context.read<AuthBloc>().add(
                const AuthEventSendEmailVerification(),
              );
            },
            child:const Text('send email verification'),
            ),
            TextButton(onPressed:()async {
              context.read<AuthBloc>().add(
                const AuthEventLogOut(),
              );
            }, 
            child: const Text('Restart'))
          ],
        ),
    );
  }
}