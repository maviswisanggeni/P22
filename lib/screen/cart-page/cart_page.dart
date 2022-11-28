import 'package:erigo/screen/cart-page/models/cart_db.dart';
import 'package:erigo/screen/cart-page/models/cart_model.dart';
import 'package:erigo/screen/detail-page/components/back_button.dart';
import 'package:erigo/screen/home/Home.dart';
import 'package:erigo/screen/payment-page/payment_success.dart';
import 'package:erigo/utils/Constant.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<CartModel> dataListCart = [];
  bool isLoading = false;

  Future read() async {
    setState(() {
      isLoading = true;
    });
    dataListCart = await CartDatabase.instance.readAll();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    read();
  }

  showDeleteDialog(BuildContext context, String? name) {
    // set up the button
    Widget cancelButton = TextButton(
        child: Text("Tidak"),
        onPressed: () {
          Navigator.of(context, rootNavigator: true).pop('dialog');
        });
    Widget okButton = TextButton(
        child: Text("Hapus"),
        onPressed: () {
          setState(() {
            isLoading = true;
          });
          CartDatabase.instance.delete(name);
          read();
          setState(() {
            isLoading = false;
          });
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MyHomePage()));
          Navigator.pop(context);
          Navigator.of(context, rootNavigator: true).pop('dialog');
        });

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      content: Text("Apakah anda yakin ingin menghapus?"),
      actions: [cancelButton, okButton],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : dataListCart.isEmpty
              ? Column(
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
                              'My Cart',
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
                    Expanded(
                      child: Center(
                        child: Text(
                          'Your cart is empty',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                )
              : Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 25,
                      ),
                      margin: EdgeInsets.only(
                        top: 25,
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
                              'My Cart',
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
                    Expanded(
                      child: ListView.builder(
                        itemCount: dataListCart.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 15,
                            ),
                            height: 130,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(
                                left: 20, right: 20, bottom: 10),
                            decoration: BoxDecoration(
                              color: Color(0xffF1F2ED),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              margin: EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 80,
                                    width: 60,
                                    child: Container(
                                      child: Image.asset(
                                        dataListCart[index].image!,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 200,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${dataListCart[index].title}',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          'Rp. ${dataListCart[index].price}00',
                                          style: TextStyle(
                                              color: Styles.secondaryColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        // show quantity
                                        Text(
                                          'Quantity: ${dataListCart[index].quantity}',
                                          style: TextStyle(
                                              color: Styles.blackColor.withOpacity(0.3),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      showDeleteDialog(
                                          context, dataListCart[index].title);
                                    },
                                    icon: Icon(Icons.delete),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    // show quantity and totalPrice
                    Container(
                      height: 100,
                      margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Total Price',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          // convert to double of all price and sum all quantity of each price and convert to string
                                          'Rp. ${dataListCart.map((e) => double.parse(e.price!) * int.parse(e.quantity!)).reduce((value, element) => value + element).toStringAsFixed(3)}',
                                          style: TextStyle(
                                              color: Styles.secondaryColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          // convert to int of all quantity and sum
                                          ' (${dataListCart.map((e) => int.parse(e.quantity!)).reduce((value, element) => value + element)})',
                                          style: TextStyle(
                                              color: Styles.blackColor.withOpacity(0.3),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
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
                        ),
                      ),
                    ),
                  ],
                ),
    );
  }
}
