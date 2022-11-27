import 'package:erigo/screen/detail-page/components/back_button.dart';
import 'package:erigo/screen/home/Home.dart';
import 'package:erigo/screen/payment-page/payment_success.dart';
import 'package:erigo/utils/Constant.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  final String title;
  final String size;
  final double price;
  final int quantity;
  final String image;
  const PaymentPage(
      {Key? key,
      required this.title,
      required this.size,
      required this.price,
      required this.quantity,
      required this.image})
      : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  late final List<String> paymentMethod = [
    'Bank Transfer',
    'Gopay',
    'Dana',
    'OVO',
    'QRIS',
  ];

  String? payment;

  String? address;

  // create function edit address
  void editAddress() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Address'),
          content: TextField(
            onChanged: (value) {
              setState(() {
                address = value;
              });
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 100,
        padding: EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 15,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'TOTAL',
                    style: TextStyle(
                      color: Styles.blackColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'Rp. ${widget.price * widget.quantity + 10}00',
                    style: TextStyle(
                      color: Styles.secondaryColor,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Future.delayed(Duration(milliseconds: 2000), () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyHomePage(),
                      ),
                    );
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentSuccess(),
                    ),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Styles.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                      strokeAlign: StrokeAlign.inside,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        spreadRadius: 0,
                        blurRadius: 4,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Text(
                    'CHECKOUT',
                    style: TextStyle(
                      color: Styles.blackColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 50,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    MyBackButton(),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 20,
                      ),
                      child: Text(
                        'Buy Directly',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Styles.blackColor,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // add container purchased items
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Purchased Items',
                      style: TextStyle(
                        color: Styles.blackColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Row(
                      children: [
                        // add image
                        Container(
                          width: 120,
                          height: 150,
                          margin: EdgeInsets.only(
                            top: 20,
                            right: 20,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(widget.image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.title,
                                style: TextStyle(
                                  color: Styles.blackColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                maxLines: 2,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                ),
                                child: Text(
                                  'Size ${widget.size}',
                                  style: TextStyle(
                                    color: Styles.blackColor.withOpacity(0.5),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                ),
                                child: Text(
                                  'Rp. ${widget.price}00',
                                  style: TextStyle(
                                    color: Styles.secondaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                ),
                                child: Text(
                                  'Quantity ${widget.quantity}',
                                  style: TextStyle(
                                    color: Styles.blackColor.withOpacity(0.5),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ]
                )
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                      ),
                      child: Text(
                        'Delivery and Payment',
                        style: TextStyle(
                          color: Styles.blackColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Delivery Address',
                            style: TextStyle(
                              color: Styles.blackColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              editAddress();
                            },
                            child: Text(
                              'Edit',
                              style: TextStyle(
                                color: Styles.secondaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: Text(
                        address ?? 'Jl Sukun Raya No.09, Besito Kulon, Besito, Kec. Gebog, Kabupaten Kudus, Jawa Tengah 59333',
                        style: TextStyle(
                          color: Styles.blackColor.withOpacity(0.5),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                      ),
                      child: Text(
                        'Payment Method',
                        style: TextStyle(
                          color: Styles.blackColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    // create payment method dropdown
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(
                        top: 10,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Styles.blackColor.withOpacity(0.5),
                        ),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          isExpanded: true,
                          value: payment ?? 'Bank Transfer',
                          items: paymentMethod.map((String value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(
                                  color: Styles.blackColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              payment = value;
                            });
                          },
                        ),
                      ),
                    ),
                    // create fee delivery and estimate
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Delivery Fee',
                            style: TextStyle(
                              color: Styles.blackColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'Rp. 10.000',
                            style: TextStyle(
                              color: Styles.blackColor.withOpacity(0.5),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Estimate',
                            style: TextStyle(
                              color: Styles.blackColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '1-2 Days',
                            style: TextStyle(
                              color: Styles.blackColor.withOpacity(0.5),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}