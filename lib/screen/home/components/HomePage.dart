import 'package:erigo/screen/home/components/CoomingSoon.dart';
import 'package:erigo/screen/home/components/HomeAppBar.dart';
import 'package:erigo/screen/home/components/HomeBanner.dart';
import 'package:erigo/screen/home/components/HomeHeroProduct.dart';
import 'package:erigo/screen/home/components/HomeNewArrivals.dart';
import 'package:erigo/screen/home/components/HomeOuter.dart';
import 'package:erigo/screen/home/components/HomeShirt.dart';
import 'package:erigo/screen/home/components/HomeTShirt.dart';
import 'package:erigo/screen/home/models/AllData.dart';
import 'package:erigo/utils/Constant.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> categories = [
    "All",
    "T-Shirt",
    "Outer",
    "Shirt",
    "Pants",
    "Accessories",
    "Footwear",
  ];

  List allProducts = [
    HomeNewArrivals(),
    HomeHeroProduct(),
  ];

  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.whiteColor,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              HomeAppBar(),
              HomeBanner(),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 25,
                ),
                width: 150,
                child: RichText(
                    text: TextSpan(
                  text: 'Everything you need',
                  style: TextStyle(
                    height: 1,
                    color: Styles.blackColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
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
                )),
              ),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          current = index;
                          if (index == 0) {
                            allProducts = [
                              HomeNewArrivals(),
                              HomeHeroProduct(),
                            ];
                          } else if (index == 1) {
                            allProducts = [
                              HomeTShirt(),
                            ];
                          } else if (index == 2) {
                            allProducts = [
                              HomeOuter(),
                            ];
                          } else if (index == 3) {
                            allProducts = [
                              HomeShirt(),
                            ];
                          } else if (index == 4) {
                            allProducts = [
                              CoomingSoon(),
                            ];
                          } else if (index == 5) {
                            allProducts = [
                              CoomingSoon(),
                            ];
                          } else if (index == 6) {
                            allProducts = [
                              CoomingSoon(),
                            ];
                          }
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                          left: index == 0 ? 25 : 0,
                          right: index == categories.length - 1 ? 25 : 15,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        height: 48,
                        decoration: BoxDecoration(
                          color: current == index ? Styles.blackColor : Colors.white,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Row(
                          children: [
                            Text(
                              categories[index],
                              style: TextStyle(
                                color: current == index ? Styles.whiteColor : Colors.grey[500],
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                ),
              ),
              ...allProducts,
            ],
          ),
        ),
      ),
    );
  }
}
