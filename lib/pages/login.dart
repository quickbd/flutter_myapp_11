import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _key = GlobalKey<FormState>();
  TextEditingController nameClt = TextEditingController();
  TextEditingController emailClt = TextEditingController();
  TextEditingController passwordClt = TextEditingController();

  bool secureText = true;
  final brownColor = Colors.brown;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
        backgroundColor: brownColor,
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Container(
        child: Form(
          child: Card(
            child: Column(
              children: [

              ],
            ),
          ),
        ),
      ),
    );
  }
}
