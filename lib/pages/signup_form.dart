import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:cms_final_final/services/auth_service.dart';
import 'package:cms_final_final/models/userModel.dart';
import 'package:cms_final_final/pages/LoginForm.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  final _authService = AuthService();

  String _name = '';
  String _email = '';
  String _password = '';
  String _passwordConfirm = '';

  bool _isLoading = false;

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        await _authService.signUp(User(
          name: _name,
          email: _email,
          password: _password,
          passwordConfirm: _passwordConfirm,
        ));
        // Signup success, do something here like navigate to another page
      } catch (e) {
        // Signup failed, show error message
        print(e);
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Signup Failed'),
            content: Text(e.toString()),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15).copyWith(top: 10),
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Color(0xff333333),
              ),
              child: TextFormField(
                style: TextStyle(color: Colors.white, fontSize: 14),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIconConstraints: BoxConstraints(minWidth: 24),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.person,
                      color: Color(0xffBDBDBD),
                      size: 20,
                    ),
                  ),
                  // labelText: 'Name',
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                  hintText: 'Enter your name',
                  hintStyle: TextStyle(
                    color: Color(0xff828282),
                    fontSize: 18,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _name = value;
                  });
                },
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15).copyWith(top: 10),
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Color(0xff333333),
              ),
              child: TextFormField(
                style: TextStyle(color: Colors.white, fontSize: 14),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIconConstraints: BoxConstraints(minWidth: 24),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.email,
                      color: Color(0xffBDBDBD),
                      size: 20,
                    ),
                  ),
                  // labelText: 'Email',
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                  hintText: 'Enter your email',
                  hintStyle: TextStyle(
                    color: Color(0xff828282),
                    fontSize: 18,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15).copyWith(top: 10),
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Color(0xff333333),
              ),
              child: TextFormField(
                style: TextStyle(color: Colors.white, fontSize: 14),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIconConstraints: BoxConstraints(minWidth: 24),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.lock,
                      color: Color(0xffBDBDBD),
                      size: 20,
                    ),
                  ),
                  // labelText: 'Password',
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                  hintText: 'Enter your password',
                  hintStyle: TextStyle(
                    color: Color(0xff828282),
                    fontSize: 18,
                  ),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  if (value.length < 8) {
                    return 'Password must be at least 8 characters long';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _password = value;
                  });
                },
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15).copyWith(top: 10),
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Color(0xff333333),
              ),
              child: TextFormField(
                style: TextStyle(color: Colors.white, fontSize: 14),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIconConstraints: BoxConstraints(minWidth: 24),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.lock,
                      color: Color(0xffBDBDBD),
                      size: 20,
                    ),
                  ),
                  // labelText: 'Confirm Password',
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                  hintText: 'Confirm your password',
                  hintStyle: TextStyle(
                    color: Color(0xff828282),
                    fontSize: 18,
                  ),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  }
                  if (value != _password) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _passwordConfirm = value;
                  });
                },
              ),
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: _isLoading ? null : _submitForm,
            child: _isLoading ? CircularProgressIndicator() : Text('Sign Up'),
          ),
          SizedBox(height: 16),
          TextButton(
           onPressed: () {
            Navigator.pushNamed(context, '/login');
          },
            child: Text('Already have an account? Log in here'),
          ),
        ],
      ),
    );
  }
}
