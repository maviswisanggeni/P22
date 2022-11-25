import 'package:erigo/utils/Constant.dart';
import 'package:flutter/material.dart';

class DetailProductText extends StatelessWidget {
  const DetailProductText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      child: RichText(
        text: TextSpan(
          text: 'Detail Product',
          style: TextStyle(
            height: 1,
            color: Styles.blackColor,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
          children: <TextSpan>[
            TextSpan(
              text: '.',
              style: TextStyle(
                height: 1,
                color: Styles.secondaryColor,
                fontSize: 24,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
