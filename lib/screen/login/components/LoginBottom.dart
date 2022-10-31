import 'package:erigo/utils/Constant.dart';
import 'package:flutter/material.dart';

class LoginBottom extends StatefulWidget {
  const LoginBottom({Key? key}) : super(key: key);

  @override
  State<LoginBottom> createState() => _LoginBottomState();
}

class _LoginBottomState extends State<LoginBottom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 30,
      ),
      child: Column(
          children: [
            Text(
                'Don\'t have an account?',
                style: TextStyle(
                  color: Styles.blackColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                )
            ),
            SizedBox(
              height: 30,
              child: TextButton(
                onPressed: () {},
                child: Text(
                    'Create Account',
                    style: TextStyle(
                      color: Styles.secondaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    )
                ),
              ),
            ),
          ]
      ),
    );
  }
}
