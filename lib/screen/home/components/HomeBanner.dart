import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeBanner extends StatefulWidget {
  const HomeBanner({Key? key}) : super(key: key);

  @override
  State<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  List<String> imgList = [
    'assets/images/banner1-hoddie.png',
    'assets/images/banner2.png',
    'assets/images/banner3-tshirt.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        height: 200,
        child: CarouselSlider(
          options: CarouselOptions(
            height: 175,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 1000),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
          ),
          items: imgList
              .map((item) => Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Center(
                        child: Image.asset(
                      height: 175,
                      width: 350,
                      item,
                      fit: BoxFit.cover,
                    )),
                    decoration: BoxDecoration(
                      color: Color(0xFFD1CEC8),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                        strokeAlign: StrokeAlign.outside,
                      ),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
