import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smarttrolley/Custom%20Widgets/BlackRoundedButton.dart';
import 'package:smarttrolley/Custom Widgets/MyAwesomeTextField.dart';
import 'package:smarttrolley/Models/UploadDownloadImage.dart';
import 'package:smarttrolley/constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String fullName, email, address, city, country, phoneNumber, uid;
  var profilePictureURL;
  var uploadDownloadImage = UploadDownloadImage();
  TextEditingController fullNameController,
      emailController,
      addressController,
      cityController,
      countryController,
      phoneNumberController;
  bool isAvatarTapped = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fullName = "Touseef Khattak";
    email = "touseefktk@gmail.com";
    address = "Mall road, Saddar, Peshawar";
    city = "Peshawar";
    country = "Pakistan";
    phoneNumber = "+92-302-3492784";
    fullNameController = TextEditingController(text: fullName);
    emailController = TextEditingController(text: email);
    addressController = TextEditingController(text: address);
    cityController = TextEditingController(text: city);
    countryController = TextEditingController(text: country);
    phoneNumberController = TextEditingController(text: phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height - 80,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "LoginScreen");
                        },
                        child: Row(
                          children: [
                            Text(
                              "Logout",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: orangeColor,
                                  fontFamily: "Source Sans Pro"),
                            ),
                            Icon(FontAwesomeIcons.walking, color: greenColor),
                          ],
                        )),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Card(
                margin: EdgeInsets.all(10),
                elevation: 10,
                color: Colors.white,
                shadowColor: Colors.black,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            if (isAvatarTapped == true) {
                              isAvatarTapped = false;
                            } else {
                              isAvatarTapped = true;
                            }
                            setState(() {});
                          },
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: profilePictureURL == "nothing" ||
                                    profilePictureURL == null
                                ? AssetImage("images/noimage.JPG")
                                : Image.file(profilePictureURL).image,
                            child: isAvatarTapped != true
                                ? Container()
                                : IconButton(
                                    alignment: Alignment.bottomCenter,
                                    tooltip: "Change Profile Picture",
                                    iconSize: 20,
                                    color: Colors.white,
                                    icon: Icon(Icons.cloud_upload_sharp),
                                    onPressed: () async {
                                      profilePictureURL =
                                          await uploadDownloadImage // use will pick the image now...
                                              .imagePicker();
                                      setState(() {
                                        isAvatarTapped = false;
                                      });
                                    },
                                  ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.1,
                      ),
                      Expanded(
                        flex: 3,
                        child: AutoSizeText(
                          fullName == null ? "Username" : fullName,
                          maxLines: 1,
                          maxFontSize: 20,
                          minFontSize: 12,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Divider(
              height: 2,
              thickness: 2,
              color: blackColor,
              indent: 0,
              endIndent: 0,
            ),
            Expanded(
                flex: 2,
                child: MyAwesomeTextField(
                  shopNameController: fullNameController,
                  outsideText: "Full Name",
                )),
            Expanded(
                flex: 2,
                child: MyAwesomeTextField(
                  shopNameController: emailController,
                  outsideText: "Email Address",
                )),
            Expanded(
                flex: 2,
                child: MyAwesomeTextField(
                  shopNameController: addressController,
                  outsideText: "Physical Address",
                )),
            Expanded(
                flex: 2,
                child: MyAwesomeTextField(
                  shopNameController: cityController,
                  outsideText: "City",
                )),
            Expanded(
                flex: 2,
                child: MyAwesomeTextField(
                  shopNameController: countryController,
                  outsideText: "Country",
                )),
            Expanded(
                flex: 2,
                child: MyAwesomeTextField(
                  shopNameController: phoneNumberController,
                  outsideText: "Phone Number",
                  keyboardType: TextInputType.phone,
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Expanded(
                flex: 1,
                child: PurpleRoundButton(
                    buttonText: "SAVE",
                    buttonWidth: 0.7,
                    buttonHeight: 0.02,
                    onPressed: () {})),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
          ],
        ),
      ),
    );
  }
}
