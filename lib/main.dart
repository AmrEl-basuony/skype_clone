import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:skype_clone/providers/google_sign_in_provider.dart';
import 'package:skype_clone/utility/navigation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final Future<FirebaseApp> _firebaseInitialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _firebaseInitialization,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ChangeNotifierProvider(
              create: (context) => GoogleSignInProvider(),
              child: MaterialApp(
                title: 'Flutter Demo',
                initialRoute: '/home',
                routes: Navigation.routes,
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                ),
              ),
            );
          }
          return const CircularProgressIndicator();
        });
  }
}
