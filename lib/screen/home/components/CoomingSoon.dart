import 'package:flutter/material.dart';

class CoomingSoon extends StatefulWidget {
  const CoomingSoon({Key? key}) : super(key: key);

  @override
  State<CoomingSoon> createState() => _CoomingSoonState();
}

class _CoomingSoonState extends State<CoomingSoon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Center(
        child: Text(
          'Cooming Soon',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
