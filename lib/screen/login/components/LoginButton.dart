import 'package:erigo/screen/home/Home.dart';
import 'package:erigo/utils/Constant.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatefulWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.15,
      height: 70,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyHomePage(),
            ),
          );
        },
        child: Text(
          'LOGIN',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Styles.blackColor,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Styles.primaryColor,
          shadowColor: Styles.blackColor,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
            side: BorderSide(
              color: Styles.blackColor,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
