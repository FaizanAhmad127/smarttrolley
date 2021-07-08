import 'package:auto_size_text/auto_size_text.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smarttrolley/constants.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<dynamic> items = [];

  ScrollController listViewController = ScrollController();
  double topItem = 0;
  String searchString = "";
  TextEditingController searchTextFieldController = TextEditingController();

  Widget listItem(dynamic post, BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        height: 150,
        child: Card(
          margin: EdgeInsets.all(10),
          elevation: 10,
          color: Colors.white,
          shadowColor: Colors.black,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.all(7),
                  child: Image.asset(
                    "images/${post["Image"]}",
                  ),
                ),
              ),
              Expanded(
                  flex: 5,
                  child: Padding(
                    padding: EdgeInsets.all(7),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: AutoSizeText(
                                post["ProductName"],
                                minFontSize: 8,
                                maxFontSize: 14,
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                    fontFamily: "Source Sans Pro"),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: AutoSizeText(
                                "Price:  ${post["ProductPrice"]}",
                                minFontSize: 8,
                                maxFontSize: 12,
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                    fontFamily: "Source Sans Pro"),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: AutoSizeText(
                                "Unit:  ${post["ProductUnit"]}",
                                minFontSize: 8,
                                maxFontSize: 12,
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                    fontFamily: "Source Sans Pro"),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: RaisedButton(
                                  color: orangeColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(5),
                                          bottomLeft: Radius.circular(5))),
                                  elevation: 10,
                                  child: AutoSizeText(
                                    "Add to My Lists",
                                    minFontSize: 8,
                                    maxFontSize: 14,
                                    maxLines: 1,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1,
                                        fontFamily: "Source Sans Pro"),
                                  ),
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) => myAlertDialog());
                                  }),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  void getListViewItems(BuildContext context) {
    List<dynamic> responseList = productInfo;
    List<Widget> widgetItemsList = [];
    responseList.forEach((post) {
      searchString = searchString.toUpperCase();
      String productName = post["ProductName"].toString().toUpperCase();
      if (searchString.isNotEmpty) {
        if (productName.contains(searchString)) {
          widgetItemsList.add(listItem(post, context));
        }
      } else {
        widgetItemsList.add(listItem(post, context));
      }
    });
    setState(() {
      items = widgetItemsList;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listViewController.addListener(() {
      double value = listViewController.offset / 170;
      setState(() {
        topItem = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    getListViewItems(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.8,
              child: Column(
                children: [
                  Expanded(
                      child: Row(
                    children: [
                      Expanded(
                        child: Card(
                          margin: EdgeInsets.all(10),
                          elevation: 10,
                          color: Colors.white,
                          shadowColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: TextField(
                              keyboardType: TextInputType.text,
                              controller: searchTextFieldController,
                              onChanged: (value) {
                                if (value.isEmpty) {
                                  searchString = value;
                                  getListViewItems(context);
                                } else {
                                  searchString = value;
                                  getListViewItems(context);
                                }
                              },
                              decoration: InputDecoration(
                                hintText: "Enter Product Name...",
                                border: InputBorder.none,
                                suffixIcon: Icon(FontAwesomeIcons.search),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
                  Expanded(
                    flex: 8,
                    child: ListView.builder(
                        itemCount: items.length,
                        controller: listViewController,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          double scale = 1.0;
                          if (topItem > 0) {
                            scale = index + 1 - topItem;
                            if (scale < 0) {
                              scale = 0;
                            } else if (scale > 1) {
                              scale = 1;
                            }
                          }
                          return Transform(
                            transform: Matrix4.identity()..scale(scale, scale),
                            alignment: Alignment.topCenter,
                            child: items[index],
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class myAlertDialog extends StatefulWidget {
  @override
  _myAlertDialogState createState() => _myAlertDialogState();
}

class _myAlertDialogState extends State<myAlertDialog> {
  List<dynamic> radioItems = [];
  int selectedRadioValue = 0;

  void getRadioButtons() {
    int radioValue = 0;
    List<Widget> widgetItemsList = [];
    differentListInfo.forEach((post) {
      radioValue++;
      widgetItemsList.add(myRadioButtons(post, radioValue));
    });
    setState(() {
      radioItems = widgetItemsList;
    });
  }

  Widget myRadioButtons(dynamic post, int radioValue) {
    return RadioListTile(
        selected: radioValue == selectedRadioValue,
        value: radioValue,
        groupValue: selectedRadioValue,
        activeColor: greenColor,
        title: AutoSizeText(
          post["ListName"],
          maxFontSize: 18,
          textAlign: TextAlign.center,
        ),
        onChanged: (value) {
          print("value is $value");
          setSelectedRadioTile(value);
          if (radioValue == selectedRadioValue) {
            print(post["ListName"]);
          }
        });
  }

  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioValue = val;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRadioButtons();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Choose among a list",
      ),
      titlePadding: EdgeInsets.all(5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      content: Container(
          width: MediaQuery.of(context).size.width * 0.6,
          height: MediaQuery.of(context).size.height * 0.2,
          child: ListView.builder(
              itemCount: radioItems.length,
              itemBuilder: (context, index) {
                return radioItems[index];
              })),
      actions: [
        Center(
          child: RaisedButton(
              child: Text(
                "Add to the List",
              ),
              color: purpleColor,
              onPressed: () {}),
        )
      ],
    );
  }
}
