import 'package:erigo/screen/profile/Profile.dart';
import 'package:erigo/utils/Constant.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool isObscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(right: 55),
          child: Center(
              child: Text(
            'My Account',
            style: TextStyle(
              color: Styles.blackColor,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          )),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Styles.blackColor,
          ),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15, top: 30, right: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(width: 4, color: Colors.white),
                          // hide box shadow
                          boxShadow: [
                            BoxShadow(
                              color: Styles.blackColor.withOpacity(0),
                            )
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  "assets/images/photo-profile.png"))),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 4, color: Colors.white),
                              color: Color(0xfff5f5f5)),
                          child: Icon(
                            Icons.edit,
                            color: Styles.blackColor,
                          ),
                        ))
                  ],
                ),
              ),
              SizedBox(height: 30),
              buildTextField(
                "Username",
                "John Doe",
                false,
              ),
              buildTextField("E-mail", "Johndoexinn@gmail.com", false),
              buildTextField("Password", "********", true),
              buildTextField("Location", "New York", false),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    child: Text("CANCEL",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Styles.blackColor)),
                    style: OutlinedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("SAVE",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Styles.blackColor)),
                    style: ElevatedButton.styleFrom(
                        primary: Color(0Xff9FBCD2),
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
        padding: EdgeInsets.only(bottom: 30),
        child: TextField(
          obscureText: isPasswordTextField ? isObscurePassword : false,
          decoration: InputDecoration(
              suffixIcon: isPasswordTextField
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          isObscurePassword = !isObscurePassword;
                        });
                      },
                      icon: Icon(
                        isObscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Color(0xff9FBCD2),
                      ),
                    )
                  : null,
              labelText: labelText,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: placeholder,
              hintStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Styles.blackColor,
              )),
        ));
  }
}
