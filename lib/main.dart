import 'package:flutter/material.dart';
import 'pages/signup_form.dart';
import 'pages/LoginForm.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       routes: {
        '/login': (context) => LoginForm(),
      },
      title: 'My App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Signup'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SignupForm(),
        ),
        
      ),
    );
  }
}