import 'package:cms_final_final/providers/UserTypeProvider.dart';
import 'package:flutter/material.dart';
import 'pages/signup_form.dart';
import 'pages/LoginForm.dart';
import 'pages/Regist.dart';
import 'package:provider/provider.dart';
// void main() {
//   runApp(MyApp());
// }

void main() {
  runApp(
    ChangeNotifierProvider<UserTypeProvider>(
      create: (_) => UserTypeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       routes: {
        '/login': (context) => LoginForm(),
      },
      title: 'My App',
      theme: ThemeData.dark(),
      home: const Scaffold(
        body:    Regist(),
        
      ),
    );
  }
}