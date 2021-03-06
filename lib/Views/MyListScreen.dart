import 'package:auto_size_text/auto_size_text.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smarttrolley/Custom%20Widgets/BlackRoundedButton.dart';
import 'package:smarttrolley/constants.dart';

class MyListScreen extends StatefulWidget {
  final String listName;
  MyListScreen({this.listName});
  @override
  _MyListScreenState createState() => _MyListScreenState();
}

class _MyListScreenState extends State<MyListScreen> {
  List<dynamic> items = [];
  ScrollController listViewController = ScrollController();
  double topItem = 0;
  String searchString = "";
  TextEditingController searchTextFieldController = TextEditingController();
  List<dynamic> abc = [];

  void productQuantityIntializer() {
    productInfo.forEach((element) {
      abc.add({
        "ProductID": element["ProductID"],
        "ProductQuantity": 0,
      });
    });
  }

  void productQuantityUpdation(String productionId, String operation) {
    var target = abc.firstWhere((item) => item["ProductID"] == productionId);
    if (target != null) {
      if (operation == "plus") {
        target["ProductQuantity"] = target["ProductQuantity"] + 1;
        getListViewItems();
      } else if (operation == "minus") {
        if (target["ProductQuantity"] >= 1)
          target["ProductQuantity"] = target["ProductQuantity"] - 1;
        getListViewItems();
      }
    }
  }

  int getProductQuantity(String productionId) {
    var target = abc.firstWhere((item) => item["ProductID"] == productionId);
    if (target != null) {
      return target["ProductQuantity"];
    } else {
      return 0;
    }
  }

  List<dynamic> getListOfProductID(String listName) {
    List newList = [];
    individualListInfo.forEach((post) {
      if (post["ListName"] == listName) {
        newList = post["ProductID"];
        print(newList);
      }
    });
    return newList;
  }

  Widget listItem(dynamic post, var productQuantity) {
    return Padding(
      padding: EdgeInsets.all(5),
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
                            Expanded(
                              child: Align(
                                  alignment: Alignment.centerRight,
                                  child: GestureDetector(
                                    child: Icon(
                                      Icons.delete_forever,
                                      color: Colors.red,
                                    ),
                                    onTap: () {},
                                  )),
                            )
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
                            Expanded(
                              child: Align(
                                alignment: Alignment.center,
                                child: AutoSizeText(
                                  "Quantity",
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
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Align(
                                      alignment: Alignment.centerRight,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          minimumSize: Size(1, 4),
                                          primary: orangeColor,
                                        ),
                                        child: AutoSizeText("+"),
                                        onPressed: () {
                                          productQuantityUpdation(
                                              post["ProductID"], "plus");
                                        },
                                      ),
                                    )),
                                    Expanded(
                                        child: Align(
                                      alignment: Alignment.center,
                                      child: AutoSizeText(
                                        productQuantity.toString(),
                                      ),
                                    )),
                                    Expanded(
                                        child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          minimumSize: Size(1, 4),
                                          primary: orangeColor,
                                        ),
                                        child: AutoSizeText("-"),
                                        onPressed: () {
                                          setState(() {
                                            productQuantityUpdation(
                                                post["ProductID"], "minus");
                                          });
                                        },
                                      ),
                                    ))
                                  ],
                                ),
                              ),
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

  void getListViewItems() {
    List<dynamic> responseList = productInfo;
    List<dynamic> listOfEligibleProductID = getListOfProductID(widget.listName);
    List<Widget> widgetItemsList = [];
    responseList.forEach((post) {
      print("product id is");
      print(post["ProductID"]);
      if (listOfEligibleProductID.contains(post["ProductID"])) {
        var productQuantity = getProductQuantity(post["ProductID"]);
        searchString = searchString.toUpperCase();
        String productName = post["ProductName"].toString().toUpperCase();
        if (searchString.isNotEmpty) {
          if (productName.contains(searchString)) {
            widgetItemsList.add(listItem(post, productQuantity));
          }
        } else {
          widgetItemsList.add(listItem(post, productQuantity));
        }
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
    productQuantityIntializer();
    getListViewItems();
    listViewController.addListener(() {
      double value = listViewController.offset / 170;
      setState(() {
        topItem = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final snackBar = SnackBar(
      backgroundColor: purpleColor,
      elevation: 10,
      padding: EdgeInsets.all(5),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
      duration: Duration(seconds: 5),
      content: Text(
        "WooooHooo! You're good to go ",
      ),
      action: SnackBarAction(
        label: "OK",
        textColor: Colors.white,
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    );

    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          backgroundColor: orangeColor,
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: AutoSizeText(
            "Save List",
            textAlign: TextAlign.center,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.99,
              child: Column(
                children: [
                  Center(
                    child: AutoSizeText(
                      widget.listName,
                      minFontSize: 12,
                      maxFontSize: 22,
                      style: TextStyle(color: greenColor, fontSize: 22),
                    ),
                  ),
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
                                  getListViewItems();
                                } else {
                                  searchString = value;
                                  getListViewItems();
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
