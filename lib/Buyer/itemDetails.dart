import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:transact/AppBar.dart';
import 'package:transact/Buyer/buyerCart.dart';
import 'package:transact/Buyer/buyerConversation.dart';
import 'package:transact/Buyer/storeDetails.dart';
import 'package:transact/utils/bottomButton.dart';
import 'package:transact/utils/fonts.dart';
import 'package:transact/utils/routes.dart';

import 'package:transact/utils/utils.dart';

class ItemDetailsBuyer extends StatefulWidget {
  @override
  _ItemDetailsBuyerState createState() => _ItemDetailsBuyerState();
}

class _ItemDetailsBuyerState extends State<ItemDetailsBuyer> {
  var counter = 1;
  List<bool> _selection = [true, false, false];
  List<String> colors = ["#FF0000", "#DBDBDB", "#001E95", "#000000"];

  List<String> images = [
    "images/item3.png",
    "images/item1.png",
    "images/item2.png",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      //  bottomSheet: _bottomSheet(),
      backgroundColor: HexColor("#F5F7FA"),
      bottomNavigationBar: _itemDetailsBottomButton(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomeAppBar(
          homepage: false,
          title: "Details",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _itemPhotos(),
            _itemName(),
            _allDetails(),
            _deliveryDetails(),
            _shopName(),
          ],
        ),
      ),
    ));
  }

  Widget _itemPhotos() {
    return Container(
      height: MediaQuery.of(context).size.height / 4,
      child: Scrollbar(
        child: ListView.builder(
          itemCount: 3,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              child: Image(
                height: 200,
                width: 200,
                image: AssetImage("${images[index]}"),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _itemName() {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Align(
              alignment: Alignment.topRight,
              child: Container(
                  height: 20,
                  width: 35,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/discountTag.png"),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "-10%",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ))),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 0.0, bottom: 10, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "iPhone X",
                  style: TextStyle(fontSize: 18, height: 2),
                ),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        style:
                            blackbold.copyWith(decoration: TextDecoration.none),
                        text: "\$1000 "),
                    TextSpan(style: blackbold, text: " \$936")
                  ]),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _allDetails() {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          _toggleButton(),
          _selection[0]
              ? _desciption()
              : _selection[1] ? _specification() : _feedback()
        ],
      ),
    );
  }

  Widget _feedback() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: Row(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          _heading("Feedback"),
                          Row(
                            children: <Widget>[
                              _fiveStar(),
                              Text(
                                "(10)",
                                style: TextStyle(fontSize: 10),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    "View All",
                    style: blackbold.copyWith(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                )
              ]),
          Container(
            child: Column(
              children: <Widget>[
                _feedbackTile(),
                _feedbackTile(),
                _feedbackTile(),
                _feedbackTile(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _feedbackTile() {
    return Container(
        margin: EdgeInsets.only(top: 5, bottom: 5),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 10),
              child: CircleAvatar(
                backgroundImage: AssetImage("images/photo1.png"),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      "John Doe",
                      style: blackbold,
                    ),
                    _fiveStar(),
                    Text(
                      "(4.0)",
                      style: blackbold.copyWith(fontSize: 10),
                    )
                  ],
                ),
                Text("Lorem ipsum dolor sit amet,"
                    "consectetur,"),
                Container(
                    margin: EdgeInsets.only(top: 15),
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: "34 ",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.black),
                        ),
                        TextSpan(
                          text: "Reply",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.blue),
                        )
                      ]),
                    ))
              ],
            ),
          ],
        ));
  }

  Widget _fiveStar() {
    return Container(
        child: Row(children: <Widget>[
      Icon(
        Icons.star,
        size: 12,
        color: Colors.yellow,
      ),
      Icon(
        Icons.star,
        size: 12,
        color: Colors.yellow,
      ),
      Icon(
        Icons.star,
        size: 12,
        color: Colors.yellow,
      ),
      Icon(
        Icons.star,
        size: 12,
        color: Colors.yellow,
      ),
      Icon(
        Icons.star,
        size: 12,
        color: Colors.yellow,
      ),
    ]));
  }

  Widget _specification() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: <Widget>[
          _heading("Specification"),
          Row(
            children: <Widget>[
              Expanded(
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "Color: ",
                        style: blackbold.copyWith(fontSize: 13)),
                    TextSpan(
                        text: " RED",
                        style:
                            blackbold.copyWith(fontSize: 13, color: Colors.red))
                  ]),
                ),
              ),
              Expanded(
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "Capacity: ",
                        style: blackbold.copyWith(fontSize: 13)),
                    TextSpan(
                        text: " 256 gb",
                        style: blackbold.copyWith(
                          fontSize: 13,
                        ))
                  ]),
                ),
              ),
            ],
          ),
          _descriptionDetails(),
          _descriptionDetails(),
          _descriptionDetails(),
          _descriptionDetails(),
          _descriptionDetails(),
        ],
      ),
    );
  }

  Widget _desciption() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: <Widget>[
          _heading("Description"),
          Text("Lorem ipsum dolor sit amet,"
              "consectetur adipiscing elit, sed do eiusmod tempor incididunt ut "
              "labore et dolore magna aliqua. "),
          _descriptionDetails(),
          _descriptionDetails(),
          _descriptionDetails(),
        ],
      ),
    );
  }

  Widget _heading(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text("$text", style: blackbold.copyWith(fontSize: 18)),
    );
  }

  Widget _descriptionDetails() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10, right: 10),
            height: 8,
            width: 8,
            color: Colors.black,
          ),
          Flexible(
            child: Container(
              child: Text("Lorem ipsum dolor sit amet,"
                  "consectetur adipiscing elit, sed do eiusmod tempor incididunt ut "
                  "labore et dolore magna aliqua. "),
            ),
          ),
        ],
      ),
    );
  }

  Widget _toggleButton() {
    return Container(
      margin: EdgeInsets.only(bottom: 20, left: 10, right: 10),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: HexColor("#D2D2D2")),
          color: HexColor("#F5F5F5"),
          borderRadius: BorderRadius.circular(30)),
      child: ToggleButtons(
        borderRadius: BorderRadius.circular(30),
        fillColor: HexColor("#F5F5F5"),
        isSelected: _selection,
        onPressed: (int index) {
          setState(() {
            for (int buttonIndex = 0;
                buttonIndex < _selection.length;
                buttonIndex++) {
              if (buttonIndex == index) {
                _selection[buttonIndex] = true;
              } else {
                _selection[buttonIndex] = false;
              }
            }
          });
        },
        renderBorder: false,
        children: <Widget>[
          AnimatedContainer(
            duration: Duration(microseconds: 10),
            padding: EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: _selection[0] == true
                    ? HexColor("#3B444B")
                    : Colors.transparent),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                '  Description  ',
                style: TextStyle(
                    fontSize: 15,
                    color: _selection[0] == true ? Colors.white : Colors.black),
              ),
            ),
          ),
          AnimatedContainer(
            duration: Duration(microseconds: 10),
            padding: EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: _selection[1] == true
                  ? HexColor("#3B444B")
                  : HexColor("#F5F5F5"),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                '  Specification  ',
                style: TextStyle(
                    fontSize: 15,
                    color: _selection[1] == true ? Colors.white : Colors.black),
              ),
            ),
          ),
          AnimatedContainer(
            duration: Duration(microseconds: 10),
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: _selection[2] == true
                    ? HexColor('#3B444B')
                    : HexColor("#F5F5F5")),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                'Feed back',
                style: TextStyle(
                    fontSize: 15,
                    color: _selection[2] == true ? Colors.white : Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemDetailsBottomButton() {
    return Container(
      height: MediaQuery.of(context).size.height * .08,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                AppRoutes.push(context, StoreDetails());
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Image.asset("images/store.png"),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                AppRoutes.push(context, BuyerConversation());
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Image.asset("images/chat.png"),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 4),
              child: BottomButton(
                name: "Buy Now",
                customColor: true,
                color: HexColor("#FFB618"),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 4),
              child: BottomButton(
                name: "Add to cart",
                color: HexColor("#FF6D2B"),
                customColor: true,
                ontap: () {
                  _showModalBottomSheet(context);
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _deliveryDetails() {
    return Container(
      color: Colors.white,
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 10, bottom: 10),
      padding: EdgeInsets.only(top: 5.0, bottom: 5, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Delivery Details",
            style: TextStyle(fontSize: 22, height: 2),
          ),
          Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit,"
              " sed do eiusmod tempor incididunt ut"
              " labore et dolore magna aliqua. ")
        ],
      ),
    );
  }

  Widget _shopName() {
    return Container(
      color: Colors.white,
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.only(top: 5.0, bottom: 5, left: 20, right: 20),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Text(
              "Shop Name",
              style: TextStyle(fontSize: 20, height: 2),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0.0),
              child: BottomButton(
                name: "Visit Here",
                color: HexColor("#FF6D2B"),
                customColor: true,
                ontap: () {
                  print("Shop URL");
                },
              ),
            ),
          )
        ],
      ),
    );
  }
  //////////////////////////// METHODS  ////////////////////////////////

  void _showModalBottomSheet(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext bc) {
          return Container(
            padding: EdgeInsets.only(top: 20, left: 15, right: 15),
            height: MediaQuery.of(context).size.height * .65,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(35),
                    topLeft: Radius.circular(35))),
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 20,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(top: 10, right: 10),
                    child: Image.asset("images/cross.png"),
                  ),
                ),
                _product(),
                _divider(),
                _colorFamily(),
                _divider(),
                _quantity(),
                Container(
                  margin: EdgeInsets.only(
                      left: 20, right: 20, top: 70, bottom: 0.0),
                  child: BottomButton(
                    name: "Add to cart",
                    customColor: true,
                    color: HexColor("#FF6D2B"),
                    ontap: () {
                      AppRoutes.push(context, BuyerCart());
                    },
                  ),
                ),
              ],
            ),
          );
        });
  }
  ////////////////////////////////////////////////////////////////////////////////////

  Widget _colorFamily() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Color Family",
            style: TextStyle(fontSize: 20, height: 3),
          ),
          Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return _colors(colors[index]);
                },
              )),
        ],
      ),
    );
  }

  Widget _bottomSheet() {
    return Container(
      padding: EdgeInsets.only(top: 20, left: 15, right: 15),
      height: MediaQuery.of(context).size.height * .65,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(35), topLeft: Radius.circular(35))),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 20,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(top: 10, right: 10),
              child: Image.asset("images/cross.png"),
            ),
          ),
          _product(),
          _divider(),
          _colorFamily(),
          _divider(),
          _quantity(),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 0.0),
            child: BottomButton(
              name: "Add to cart",
              customColor: true,
              color: HexColor("#FF6D2B"),
              ontap: () {
                AppRoutes.push(context, BuyerCart());
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _quantity() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Quantity",
            style: TextStyle(fontSize: 20, height: 3),
          ),
          _counter()
        ],
      ),
    );
  }

  Widget _counter() {
    return Container(
      height: 38,
      width: MediaQuery.of(context).size.width * .31,
      padding: EdgeInsets.symmetric(horizontal: 5),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              setState(() {
                counter >= 2 ? counter-- : null;
              });
            },
            child: Container(height: 30, child: Icon(Icons.remove)),
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 17),
              child: Text(
                "$counter",
                style: TextStyle(fontSize: 20),
              )),
          GestureDetector(
            onTap: () {
              setState(() {
                counter++;
              });
            },
            child: Container(height: 30, child: Icon(Icons.add)),
          ),
        ],
      ),
    );
  }

  Widget _colors(String color) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(20),
          color: HexColor("$color")),
    );
  }

  Widget _divider() {
    return Container(
      width: double.infinity,
      height: 1,
      color: Colors.grey,
    );
  }

  Widget _title(String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Text("$text",
          style: TextStyle(
            color: HexColor("#9E9E9E"),
            fontFamily: 'Roboto',
            fontSize: 15,
          )),
    );
  }

  Widget _orderDetailLine(String text1, String text2) {
    return Container(
      margin: EdgeInsets.only(bottom: text1 == "Order #" ? 10 : 5),
      child: Row(
        children: <Widget>[
          Text(
            "$text1",
            textAlign: TextAlign.start,
            style: TextStyle(
                color: text1 == "Order #" ? Colors.black : HexColor("#6B6B6B"),
                fontSize: text1 == "Order #" ? 18 : 12),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            "$text2",
            textAlign: TextAlign.start,
            style: TextStyle(
                color: text1 == "Order #" ? Colors.black : HexColor("#6B6B6B"),
                fontSize: text1 == "Order #" ? 18 : 12),
          ),
        ],
      ),
    );
  }

  Widget _product() {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            height: 70,
            width: 70,
            child: Image.asset("images/iphone.png"),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "iPhone X",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                "\$924",
                textAlign: TextAlign.left,
                style: TextStyle(
                    height: 1.4, fontSize: 14, color: HexColor("#515C6F")),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
