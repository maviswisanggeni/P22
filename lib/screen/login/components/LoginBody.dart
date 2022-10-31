import 'package:erigo/screen/login/components/EmailField.dart';
import 'package:erigo/screen/login/components/LoginBottom.dart';
import 'package:erigo/screen/login/components/LoginButton.dart';
import 'package:erigo/screen/login/components/LoginImage.dart';
import 'package:erigo/screen/login/components/PasswordField.dart';
import 'package:erigo/utils/Constant.dart';
import 'package:flutter/material.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // login image
          LoginImage(),

          // login body
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // login field
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 30,
                        ),
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            color: Styles.blackColor,
                          ),
                        ),
                      ),
                      // email field
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          'Email',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Styles.blackColor,
                          ),
                        ),
                      ),
                      EmailField(),
                      // password field
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: Text(
                          'Password',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Styles.blackColor,
                          ),
                        ),
                      ),
                      PasswordField(),
                      // login button
                      Padding(
                        padding: const EdgeInsets.only(top: 35),
                        child: LoginButton(),
                      ),
                    ],
                  ),
                ),
                // forgot password
                Container(
                  margin: EdgeInsets.only(bottom: 50),
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Styles.blackColor,
                    ),
                  ),
                ),

                // login bottom
                LoginBottom(),
              ],
            ),
          )
        ]
      )
    );
  }
}
