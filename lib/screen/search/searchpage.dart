import 'package:erigo/screen/home/components/HomeBody.dart';
import 'package:erigo/utils/Constant.dart';
import 'package:flutter/material.dart';

class searchpage extends StatefulWidget {
  const searchpage({super.key});

  @override
  State<searchpage> createState() => _searchpageState();
}

class _searchpageState extends State<searchpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 345,
                  height: 60,
                  margin: EdgeInsets.only(
                    top: 50,
                    left: 20,
                  ),
                  padding: EdgeInsets.only(left: 20, top: 5),
                  child: TextField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.search, color: Styles.blackColor),
                      hintText: "Search On Erigo",
                      hintStyle: TextStyle(
                        color: Styles.blackColor,
                        fontSize: 15,
                      ),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                      color: Styles.blackColor,
                      fontSize: 15,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xffF1F2ED),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                    width: 400,
                    height: 30,
                    margin: EdgeInsets.only(
                      top: 30,
                      left: 20,
                    ),
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      "Last Searched",
                      style: TextStyle(
                        color: Styles.blackColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                Container(
                    width: 400,
                    height: 60,
                    margin: EdgeInsets.only(
                      top: 10,
                    ),
                    padding: EdgeInsets.only(top: 5),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xfffafafa)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        fixedSize: MaterialStateProperty.all(Size(342, 72)),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            margin: EdgeInsets.only(),
                            child: IconButton(
                              padding: EdgeInsets.only(left: 0),
                              onPressed: () {},
                              icon: Icon(Icons.history),
                              color: Styles.blackColor,
                            ),
                          ),
                          Container(
                            width: 200,
                            height: 60,
                            margin: EdgeInsets.only(
                              top: 10,
                            ),
                            padding: EdgeInsets.only(top: 5),
                            child: Text(
                              "Erigo work shirt",
                              style: TextStyle(
                                color: Styles.blackColor,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Container(
                            width: 60,
                            height: 60,
                            margin: EdgeInsets.only(),
                            child: IconButton(
                              padding: EdgeInsets.only(left: 50),
                              onPressed: () {},
                              icon: Icon(Icons.close),
                              color: Styles.blackColor,
                            ),
                          ),
                        ],
                      ),
                    )
                  )
              ],
            ),
            Column(
              children: [
                Container(
                    width: 400,
                    height: 60,
                    margin: EdgeInsets.only(
                      top: 0,
                    ),
                    padding: EdgeInsets.only(top: 5),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xfffafafa)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        fixedSize: MaterialStateProperty.all(Size(342, 72)),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            margin: EdgeInsets.only(),
                            child: IconButton(
                              padding: EdgeInsets.only(left: 0),
                              onPressed: () {},
                              icon: Icon(Icons.history),
                              color: Styles.blackColor,
                            ),
                          ),
                          Container(
                            width: 200,
                            height: 60,
                            margin: EdgeInsets.only(
                              top: 10,
                            ),
                            padding: EdgeInsets.only(top: 5),
                            child: Text(
                              "Erigo Knitwear",
                              style: TextStyle(
                                color: Styles.blackColor,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Container(
                            width: 60,
                            height: 60,
                            margin: EdgeInsets.only(),
                            child: IconButton(
                              padding: EdgeInsets.only(left: 50),
                              onPressed: () {},
                              icon: Icon(Icons.close),
                              color: Styles.blackColor,
                            ),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
            Column(
              children: [
                Container(
                    width: 400,
                    height: 60,
                    margin: EdgeInsets.only(
                      top: 0,
                    ),
                    padding: EdgeInsets.only(top: 5),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xfffafafa)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        fixedSize: MaterialStateProperty.all(Size(342, 72)),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            margin: EdgeInsets.only(),
                            child: IconButton(
                              padding: EdgeInsets.only(left: 0),
                              onPressed: () {},
                              icon: Icon(Icons.history),
                              color: Styles.blackColor,
                            ),
                          ),
                          Container(
                            width: 200,
                            height: 60,
                            margin: EdgeInsets.only(
                              top: 10,
                            ),
                            padding: EdgeInsets.only(top: 5),
                            child: Text(
                              "Erigo T-Shirt",
                              style: TextStyle(
                                color: Styles.blackColor,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Container(
                            width: 60,
                            height: 60,
                            margin: EdgeInsets.only(),
                            child: IconButton(
                              padding: EdgeInsets.only(left: 50),
                              onPressed: () {},
                              icon: Icon(Icons.close),
                              color: Styles.blackColor,
                            ),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: 30,
                    right: 230,
                  ),
                  child: Text(
                    "Last Seen",
                    style: TextStyle(
                        color: Styles.blackColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            top: 20,
                            left: 20,
                          ),
                          child: InkWell(
                            onTap: () {}, // Handle your callback.
                            splashColor: Colors.brown.withOpacity(0.5),
                            child: Ink(
                              height: 155,
                              width: 125,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/new arrival - erigo knitwear walker grey.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            top: 20,
                            left: 20,
                          ),
                          child: InkWell(
                            onTap: () {}, // Handle your callback.
                            splashColor: Colors.brown.withOpacity(0.5),
                            child: Ink(
                              height: 155,
                              width: 125,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/new arrival - erigo knitwear latham grey.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            top: 20,
                            left: 20,
                          ),
                          child: InkWell(
                            onTap: () {}, // Handle your callback.
                            splashColor: Colors.brown.withOpacity(0.5),
                            child: Ink(
                              height: 155,
                              width: 125,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/new arrival - erigo work shirt tesla black.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        )),
      ),
    );
  }
}
