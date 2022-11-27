import 'package:erigo/screen/home/Home.dart';
import 'package:erigo/utils/Constant.dart';
import 'package:flutter/material.dart';

class PaymentSuccess extends StatefulWidget {
  const PaymentSuccess({Key? key}) : super(key: key);

  @override
  State<PaymentSuccess> createState() => _PaymentSuccessState();
}

class _PaymentSuccessState extends State<PaymentSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:Center(
        child: Column(
          children: [
            Container(
              child: Stack(
                alignment: Alignment.center,
                children: [

                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/payment-bg.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Image.asset(
                      'assets/images/payment.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}
