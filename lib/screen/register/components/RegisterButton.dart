import 'package:erigo/screen/home/Home.dart';
import 'package:erigo/utils/Constant.dart';
import 'package:flutter/material.dart';

class RegisterButton extends StatefulWidget {
  const RegisterButton({Key? key}) : super(key: key);

  @override
  State<RegisterButton> createState() => _RegisterButtonState();
}

class _RegisterButtonState extends State<RegisterButton> {
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
          'Create Account',
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
