import 'package:flutter/material.dart';

class LoginImage extends StatefulWidget {
  const LoginImage({Key? key}) : super(key: key);

  @override
  State<LoginImage> createState() => _LoginImageState();
}

class _LoginImageState extends State<LoginImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/login-register-bg.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
