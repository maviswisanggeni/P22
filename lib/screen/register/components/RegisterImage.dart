import 'package:flutter/material.dart';

class RegisterImage extends StatefulWidget {
  const RegisterImage({Key? key}) : super(key: key);

  @override
  State<RegisterImage> createState() => _RegisterImageState();
}

class _RegisterImageState extends State<RegisterImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/login-register-bg.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
