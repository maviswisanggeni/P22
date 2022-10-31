import 'package:erigo/screen/register/components/RegisterBottom.dart';
import 'package:erigo/screen/register/components/RegisterButton.dart';
import 'package:erigo/screen/register/components/RegisterEmailField.dart';
import 'package:erigo/screen/register/components/RegisterImage.dart';
import 'package:erigo/screen/register/components/RegisterNameField.dart';
import 'package:erigo/screen/register/components/RegisterPasswordField.dart';
import 'package:erigo/utils/Constant.dart';
import 'package:flutter/material.dart';

class RegisterBody extends StatefulWidget {
  const RegisterBody({Key? key}) : super(key: key);

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
            children: [
              // login image
              RegisterImage(),

              // login body
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // login field
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 30,
                            ),
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w600,
                                color: Styles.blackColor,
                              ),
                            ),
                          ),
                          // name field
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              'Name',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Styles.blackColor,
                              ),
                            ),
                          ),
                          RegisterNameField(),
                          // email field
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            child: Text(
                              'Email',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Styles.blackColor,
                              ),
                            ),
                          ),
                          RegisterEmailField(),
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
                          RegisterPasswordField(),
                          // login button
                          Padding(
                            padding: const EdgeInsets.only(top: 35),
                            child: RegisterButton(),
                          ),
                        ],
                      ),
                    ),
                    // login bottom
                    RegisterBottom(),
                  ],
                ),
              )
            ]
        )
    );
  }
}
