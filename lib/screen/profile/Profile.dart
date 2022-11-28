import 'package:erigo/screen/login/Login.dart';
import 'package:erigo/screen/profile/components/EditProfile.dart';
import 'package:erigo/utils/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.whiteColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Styles.whiteColor,
        title: Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Center(
            child: Text(
              'Profile',
              style: TextStyle(
                color: Styles.blackColor,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        // hide the back button
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(5),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      border: Border.all(color: Styles.whiteColor, width: 5),
                      shape: BoxShape.circle,
                      color: Styles.whiteColor,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/photo-profile.png"),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      'John Doe',
                      style: TextStyle(
                        color: Styles.blackColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      'Johndoexinn@gmail.com',
                      style: TextStyle(
                        color: Styles.blackColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    width: 500,
                    padding: EdgeInsets.only(
                        left: 10, top: 10, right: 10, bottom: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(
                              top: 10, left: 10, right: 10, bottom: 10),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditProfile()),
                              );
                            },
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0),
                              backgroundColor: MaterialStateColor.resolveWith(
                                  (states) => Color(0xffF5F5F5)),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              fixedSize:
                                  MaterialStateProperty.all(Size(342, 72)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  SvgPicture.asset(
                                      'assets/icons/person-fill-icon.svg'),
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(
                                      "My Account",
                                      style: TextStyle(
                                        color: Styles.blackColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ]),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Styles.blackColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(
                              top: 10, left: 10, right: 10, bottom: 10),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0),
                              backgroundColor: MaterialStateColor.resolveWith(
                                  (states) => Color(0xffF5F5F5)),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              fixedSize:
                                  MaterialStateProperty.all(Size(342, 72)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  SvgPicture.asset(
                                      'assets/icons/bell-fill-icon.svg'),
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(
                                      "Notifications",
                                      style: TextStyle(
                                        color: Styles.blackColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ]),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Styles.blackColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(
                              top: 10, left: 10, right: 10, bottom: 10),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0),
                              backgroundColor: MaterialStateColor.resolveWith(
                                  (states) => Color(0xffF5F5F5)),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              fixedSize:
                                  MaterialStateProperty.all(Size(342, 72)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  SvgPicture.asset(
                                      'assets/icons/settings-fill-icon.svg'),
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(
                                      "Settings",
                                      style: TextStyle(
                                        color: Styles.blackColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ]),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Styles.blackColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(
                              top: 10, left: 10, right: 10, bottom: 10),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0),
                              backgroundColor: MaterialStateColor.resolveWith(
                                  (states) => Color(0xffF5F5F5)),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              fixedSize:
                                  MaterialStateProperty.all(Size(342, 72)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  Icon(
                                    Icons.help,
                                    color: Styles.blackColor,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(
                                      "Help Center",
                                      style: TextStyle(
                                        color: Styles.blackColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ]),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Styles.blackColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(
                              top: 10, left: 10, right: 10, bottom: 10),
                          child: ElevatedButton(
                            onPressed: () {
                              // create show dialog and go to login page
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      content: Text(
                                          "Do you want to logout from your account?"),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("Cancel",
                                              style: TextStyle(
                                                fontSize: 15,
                                                  color: Styles.blackColor,
                                                  fontWeight: FontWeight.bold)
                                                ),
                                          
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        LoginPage()));
                                          },
                                          child: Text("Logout",
                                          style: TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold)
                                                ),
                                          
                                        ),
                                      ],
                                    );
                                  });    
                            },
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0),
                              backgroundColor: MaterialStateColor.resolveWith(
                                  (states) => Color(0xffF5F5F5)),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              fixedSize:
                                  MaterialStateProperty.all(Size(342, 72)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  Icon(
                                    Icons.logout,
                                    color: Styles.blackColor,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(
                                      "Log Out",
                                      style: TextStyle(
                                        color: Styles.blackColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ]),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Styles.blackColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
