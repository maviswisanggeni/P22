import 'package:erigo/screen/home/models/AllData.dart';
import 'package:erigo/utils/Constant.dart';
import 'package:flutter/material.dart';

class HomeOuter extends StatefulWidget {
  const HomeOuter({Key? key}) : super(key: key);

  @override
  State<HomeOuter> createState() => _HomeOuterState();
}

class _HomeOuterState extends State<HomeOuter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 15,
      ),
      child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Outer',
                  style: TextStyle(
                    color: Styles.blackColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'See More',
                    style: TextStyle(
                      color: Styles.blackColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),

            Container(
              margin: EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: GridView.builder(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: outer.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.5,
                  mainAxisExtent: 275,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {

                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                              children: [
                                Container(
                                  height: 220,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    image: DecorationImage(
                                      image: AssetImage(outer[index].image),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                    top: 0,
                                    left: 0,
                                    // create label get data from list newArrivals in AllDataModel class in utils/Constant.dart
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          width: 40,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: Styles.secondaryColor,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(5),
                                            ),
                                          ),
                                          child: Text(
                                            outer[index].discount,
                                            style: TextStyle(
                                              color: Styles.whiteColor,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                )
                              ]
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: 10,
                              bottom: 4,
                            ),
                            child: Text(
                              outer[index].title,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Styles.blackColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Rp. ${outer[index].statingPrice.toString()}00',
                                    style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      height: 1,
                                      color: Colors.grey[500],
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    'Rp. ${outer[index].finalPrice.toString()}00',
                                    style: TextStyle(
                                      height: 1,
                                      color: Styles.secondaryColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              )
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ]
      ),
    );
  }
}
