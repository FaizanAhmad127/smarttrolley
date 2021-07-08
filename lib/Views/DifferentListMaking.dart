import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:smarttrolley/Views/MyListScreen.dart';
import 'package:smarttrolley/constants.dart';

class DifferentListMaking extends StatefulWidget {
  const DifferentListMaking({Key key}) : super(key: key);

  @override
  _DifferentListMakingState createState() => _DifferentListMakingState();
}

class _DifferentListMakingState extends State<DifferentListMaking> {
  List<dynamic> items = [];
  List<dynamic> newDifferentList = differentListInfo;
  String newListName;
  ScrollController listViewController = ScrollController();
  double topItem = 0;
  TextEditingController searchTextFieldController = TextEditingController();

  Widget listItem(dynamic post, BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        height: 100,
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
                  flex: 5,
                  child: Padding(
                    padding: EdgeInsets.all(7),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Expanded(
                                flex: 4,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: AutoSizeText(
                                              post["ListName"],
                                              minFontSize: 8,
                                              maxFontSize: 14,
                                              maxLines: 1,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  letterSpacing: 1,
                                                  fontFamily:
                                                      "Source Sans Pro"),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: AutoSizeText(
                                              "Date:  ${post["ListDate"]}",
                                              minFontSize: 8,
                                              maxFontSize: 12,
                                              maxLines: 1,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  letterSpacing: 1,
                                                  fontFamily:
                                                      "Source Sans Pro"),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                            Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: GestureDetector(
                                        child: Icon(
                                          Icons.restore_from_trash_rounded,
                                          color: Colors.red,
                                        ),
                                        onTap: () {},
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MyListScreen(
                                                          listName: post[
                                                              "ListName"])));
                                        },
                                        child: Icon(
                                            Icons.arrow_forward_ios_rounded),
                                      ),
                                    )
                                  ],
                                )),
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

  void addNewList(String listName, BuildContext context) {
    DateTime dateTime = DateTime.now();

    Map<String, String> newMap = {
      "ListName": listName,
      "ListDate": "${dateTime.month}/${dateTime.day}/${dateTime.year}",
    };
    newDifferentList.add(newMap);
    getListViewItems(context);
  }

  void getListViewItems(BuildContext context) {
    List<dynamic> responseList = newDifferentList;
    List<Widget> widgetItemsList = [];
    responseList.forEach((post) {
      widgetItemsList.add(listItem(post, context));
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
    BuildContext myContext = context;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(
                  "Enter the name of list",
                ),
                titlePadding: EdgeInsets.all(5),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                content: Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.height * 0.03,
                    child: TextField(
                      onChanged: (value) {
                        newListName = value;
                      },
                    )),
                actions: [
                  Center(
                    child: RaisedButton(
                        child: Text(
                          "Add List",
                        ),
                        color: purpleColor,
                        onPressed: () {
                          if (newListName != null) {
                            addNewList(newListName, myContext);
                            Navigator.pop(context);
                          }
                        }),
                  )
                ],
              ),
            );
          },
          backgroundColor: orangeColor,
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Icon(Icons.add),
        ),
        body: Padding(
          padding: EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.8,
              child: Column(
                children: [
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
