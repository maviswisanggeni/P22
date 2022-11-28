import 'package:carousel_slider/carousel_slider.dart';
import 'package:erigo/screen/cart-page/models/cart_db.dart';
import 'package:erigo/screen/cart-page/models/cart_model.dart';
import 'package:erigo/screen/detail-page/components/back_button.dart';
import 'package:erigo/screen/detail-page/components/detail_product_text.dart';
import 'package:erigo/screen/home/components/HomeNewArrivals.dart';
import 'package:erigo/screen/home/models/AllData.dart';
import 'package:erigo/screen/payment-page/payment_page.dart';
import 'package:erigo/screen/wishlist-page/models/wishlist_db.dart';
import 'package:erigo/screen/wishlist-page/models/wishlist_model.dart';
import 'package:erigo/utils/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:readmore/readmore.dart';

class DetailPage extends StatefulWidget {
  final AllDataModel data;
  const DetailPage({Key? key, required this.data}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool checkExist = false;
  bool checkExistCart = false;
  Color colorChecked = Colors.grey;
  int current = 0;
  int quantity = 1;
  String size = '';
  final CarouselController _controller = CarouselController();

  Future read() async {
    checkExist = await WishlistDatabase.instance.read(widget.data.title);
    setState(() {});
  }

  // read CartDatabase
  Future readCart() async {
    checkExistCart = await CartDatabase.instance.read(widget.data.title);
    setState(() {});
  }

  Future addData() async {
    var wishlist;
    wishlist = WishlistModel(
      title: widget.data.title.toString(),
      price: widget.data.finalPrice.toString(),
      image: widget.data.image.toString(),
    );
    await WishlistDatabase.instance.create(wishlist);
    setState(() {
      checkExist = true;
    });
  }

  // add data to CartDatabase
  Future addDataCart() async {
    var cart;
    cart = CartModel(
      title: widget.data.title.toString(),
      price: widget.data.finalPrice.toString(),
      image: widget.data.image.toString(),
      quantity: quantity.toString(),
    );
    await CartDatabase.instance.create(cart);
    setState(() {
      checkExistCart = true;
    });
  }

  Future deleteData() async {
    await WishlistDatabase.instance.delete(widget.data.title);
    setState(() {
      checkExist = false;
    });
  }

  // delete data from CartDatabase
  Future deleteDataCart() async {
    await CartDatabase.instance.delete(widget.data.title);
    setState(() {
      checkExistCart = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    read();
    readCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 25),
        height: 100,
        color: Styles.whiteColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.center,
              height: 60,
              width: 80,
              margin: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black12,
                ),
                color: Styles.whiteColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                onPressed: () {
                  checkExist ? deleteData() : addData();
                },
                icon: checkExist
                    ? SvgPicture.asset(
                        'assets/icons/heart-fill-icon.svg',
                        color: Colors.red,
                        width: 26,
                        height: 26,
                      )
                    : SvgPicture.asset(
                        'assets/icons/heart-outline-icon.svg',
                        color: Colors.black,
                        width: 26,
                        height: 26,
                      ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 60,
              width: 100,
              margin: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black12,
                ),
                color: Styles.whiteColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                onPressed: () {
                  // checkExistCart if true show alert then delete data
                  if (checkExistCart) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Are you sure?'),
                          content: Text('Do you want to delete this item?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                deleteDataCart();
                                Navigator.pop(context);
                              },
                              child: Text('Delete'),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Success'),
                          content: Text('Add to cart success'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                addDataCart();
                                Navigator.pop(context);
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                icon: SvgPicture.asset(
                        'assets/icons/cart-outline-icon.svg',
                        color: Colors.black,
                        width: 26,
                        height: 26,
                      ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentPage(
                      title: widget.data.title,
                      size: current == 0 ? 'S' : current == 1 ? 'M' : current == 2 ? 'L' : current == 3 ? 'XL' : 'XXL',
                      price: widget.data.finalPrice,
                      quantity: quantity,
                      image: widget.data.image,
                    ),
                  ),
                );
              },
              child: Container(
                alignment: Alignment.center,
                height: 60,
                width: 150,
                margin: EdgeInsets.symmetric(vertical: 20),
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
                  'BUY NOW',
                  style: TextStyle(
                    color: Styles.blackColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xffF1F2ED),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height - 100,
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  margin: EdgeInsets.only(
                    top: 20,
                  ),
                  width: double.infinity,
                  child: CarouselSlider(
                    carouselController: _controller,
                    options: CarouselOptions(
                      height: MediaQuery.of(context).size.height * 0.6,
                      autoPlay: true,
                      enlargeCenterPage: false,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 1000),
                      viewportFraction: 1,
                    ),
                    items: widget.data.imageList.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            child: Image.asset(
                              i,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 20,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        MyBackButton(),
                        DetailProductText(),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.6 - 100,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            'assets/icons/share-outline-icon.svg',
                            width: 24,
                            height: 24,
                          ),
                        ),
                        Container(
                          width: 70,
                          child: Row(
                            children: [
                              Expanded(
                                child: IconButton(
                                  onPressed: () {},
                                  icon: SvgPicture.asset(
                                    'assets/icons/star-outline-icon.svg',
                                    width: 18,
                                    height: 18,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  widget.data.rating.toString(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.33,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    padding: EdgeInsets.only(
                      top: 30,
                      left: 30,
                      right: 30,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            textAlign: TextAlign.center,
                            widget.data.title,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 10,
                            ),
                            child: ReadMoreText(
                              textAlign: TextAlign.justify,
                              widget.data.description,
                              trimLines: 2,
                              colorClickableText: Styles.secondaryColor,
                              moreStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Styles.secondaryColor,
                              ),
                              lessStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Styles.secondaryColor,
                              ),
                              trimMode: TrimMode.Line,
                              trimCollapsedText: 'Read more',
                              trimExpandedText: 'Less',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 10,
                                  ),
                                  child: Text(
                                    'Size',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                // create horizontal listview.builder for size data
                                Container(
                                  height: 40,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: widget.data.size.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            current = index;
                                            size = widget.data.size[index];
                                          });
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(
                                            right: 10,
                                          ),
                                          child: Container(
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 15,
                                              vertical: 5,
                                            ),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                width: 1,
                                                color: current == index
                                                    ? Colors.black
                                                    : Colors.black12,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Text(
                                              widget.data.size[index],
                                              style: TextStyle(
                                                color: current == index
                                                    ? Colors.black
                                                    : Colors.black38,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    top: 20,
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(children: [
                                              Text(
                                                'Rp ${widget.data.statingPrice}00',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                ),
                                              ),
                                              Text(
                                                '  ${widget.data.discount}',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                  color: Styles.secondaryColor,
                                                ),
                                              ),
                                            ]),
                                            Text(
                                              'Rp ${widget.data.finalPrice}00',
                                              style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          // add plus minus button
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  if (quantity > 1) {
                                                    quantity--;
                                                  }
                                                });
                                              },
                                              child: Container(
                                                width: 24,
                                                height: 24,
                                                child: Icon(
                                                  Icons.remove,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: Colors.black
                                                    .withOpacity(0.02),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              margin: EdgeInsets.symmetric(
                                                horizontal: 15,
                                              ),
                                              child: Text(
                                                quantity.toString(),
                                                style: TextStyle(
                                                  color: Styles.secondaryColor,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  quantity++;
                                                });
                                              },
                                              child: Container(
                                                width: 24,
                                                height: 24,
                                                child: Icon(
                                                  Icons.add,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // create a container for the title and description with scroll view
        ],
      ),
    );
  }
}
