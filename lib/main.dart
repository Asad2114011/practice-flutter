import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/firebase_options.dart';
import 'package:mynotes/views/login_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: 'Practice Flutter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Homepage(),
    ),
  );
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  //  class _HomePageState extends State<HomePage>{}
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: const Color.fromARGB(255, 45, 212, 29),
      ),
      body: FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
             final user=FirebaseAuth.instance.currentUser;
             if(user?.emailVerified??false){
              print('Youre a verified user');
             }
             else{
              print('youre not a verified user');
             }
              return const Text('Done');
            default:
              return const Text('Loading....');
          }
        },
      ),
    );
  }
}
