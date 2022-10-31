import 'package:erigo/screen/register/components/RegisterBody.dart';
import 'package:erigo/screen/register/components/RegisterButton.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: RegisterBody(),
        ),
      ),
    );
  }
}
