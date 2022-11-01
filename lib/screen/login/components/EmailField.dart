import 'package:erigo/utils/Constant.dart';
import 'package:flutter/material.dart';

class EmailField extends StatefulWidget {
  const EmailField({Key? key}) : super(key: key);

  @override
  State<EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.15,
      height: 70,
      decoration: BoxDecoration(
        color: Styles.whiteColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 4,
            offset: const Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Styles.blackColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Styles.blackColor,
              width: 1,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: 25,
            horizontal: 25,
          ),
          hintText: "Email",
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
