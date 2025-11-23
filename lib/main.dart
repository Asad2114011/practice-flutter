import 'package:flutter/material.dart';
import 'package:mynotes/constants/routes.dart';
import 'package:mynotes/services/auth/auth_services.dart';
import 'package:mynotes/views/login_view.dart';
import 'package:mynotes/views/note_views.dart';
import 'package:mynotes/views/register_view.dart';
import 'package:mynotes/views/verify_email_views.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: 'Practice Flutter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Homepage(),
      routes: {
        loginRoute:(context)=>const LoginView(),
        registerRoute:(context)=>const RegisterView(),
        noteRoute:(context)=>const NoteView(),
        verifyEmailroute:(context)=>const verifyEmailview(),
      },
    ),
  );
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  //  class _HomePageState extends State<HomePage>{}
  Widget build(BuildContext context) {
    return FutureBuilder(
        future:AuthService.firebase().initialize(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
            final user=AuthService.firebase().currentUser;
            if(user!=null){
             // return NoteView();
              if(user.isEmailVerified){
                return const NoteView(); 
              }
              else{
                return const verifyEmailview();
              }
            }
            else{
              return const LoginView();
            }         
            default:
              return const CircularProgressIndicator();
          }
        },
      );
  }
}   
