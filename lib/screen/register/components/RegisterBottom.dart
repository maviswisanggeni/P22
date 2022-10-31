import 'package:erigo/utils/Constant.dart';
import 'package:flutter/material.dart';

class RegisterBottom extends StatefulWidget {
  const RegisterBottom({Key? key}) : super(key: key);

  @override
  State<RegisterBottom> createState() => _RegisterBottomState();
}

class _RegisterBottomState extends State<RegisterBottom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 30,
      ),
      child: Column(
          children: [
            Text(
                'Already have an account?',
                style: TextStyle(
                  color: Styles.blackColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                )
            ),
            SizedBox(
              height: 35,
              child: TextButton(
                onPressed: () {},
                child: Text(
                    'Login',
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
