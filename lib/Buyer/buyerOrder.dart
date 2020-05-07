import 'package:flutter/material.dart';
import 'package:transact/AppBar.dart';
import 'package:transact/utils/bottomButton.dart';
import 'package:transact/utils/fonts.dart';
import 'package:transact/utils/togglebuttons.dart';
import 'package:transact/utils/utils.dart';

class BuyerOrder extends StatefulWidget {
  @override
  _BuyerOrderState createState() => _BuyerOrderState();
}

class _BuyerOrderState extends State<BuyerOrder> {
  List<bool> _selection = [true, false];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: HexColor("#F5F7FA"),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: CustomeAppBar(
          title: "My Orders",
          homepage: false,
          child: ToggleButton(
            isSelected: _selection,
            buttonCount: 2,
            child1Title: "Pending",
            child2Title: "Received",
            onPress: (int index) {
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
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            _myOrders(),
            _selection[1] ? _receivedOrderDetails(context) : _orderStatus(),
          ],
        ),
      ),
    ));
  }

  Widget _myOrders() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "My Orders",
                style: blackbold.copyWith(fontSize: 20, height: 1.2),
              ),
              GestureDetector(
                onTap: () {
                  print("wokring");
                },
                child: Text(
                  "View All",
                  style: blackbold.copyWith(
                      decoration: TextDecoration.underline,
                      fontSize: 15,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height * .2,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  child: _orderCard(),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _orderCard() {
    return Container(
      height: MediaQuery.of(context).size.height * .2,
      width: MediaQuery.of(context).size.width / 2,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 1.0)]),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Order #",
                  style: blackbold.copyWith(fontSize: 15),
                ),
                Text("CK128MJ",
                    style: blackbold.copyWith(
                      fontSize: 15,
                    )),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[Text("Placed on:"), Text("10-01-2020")],
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              child: Text(
                "Total   \$291",
                style: blackbold.copyWith(
                  color: HexColor("#334765"),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _orderStatus() {
    return Container(
      color: Colors.white,
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(
        top: 8,
      ),
      padding: EdgeInsets.only(left: 20),
      width: MediaQuery.of(context).size.width,
      child: Column(children: <Widget>[
        Container(
          alignment: Alignment.bottomLeft,
          margin: EdgeInsets.only(top: 15, bottom: 10),
          child: Text(
            "Order Status",
            style: blackbold.copyWith(fontSize: 20),
          ),
        ),
        Row(children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _progessIndicator(1),
              _progessIndicator(2),
              _progessIndicator(3),
              _progessIndicator(4),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _orderProgress("Order Received"),
              _orderProgress("Payment Received"),
              _orderProgress("Processing"),
              _orderProgress("All Shipped"),
            ],
          ),
        ]),
      ]),
    );
  }

  Widget _orderProgress(String text) {
    return Container(
      padding: EdgeInsets.only(
        top: text == "All Shipped" ? 10 : 20,
        left: 20,
        bottom: text == "All Shipped" ? 20 : 0,
      ),
      width: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "$text",
            style: blackbold.copyWith(fontSize: 17),
          ),
          text == "Processing"
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Estimated Shipping Date",
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "10-01-2020",
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                )
              : text == "All Shipped"
                  ? Container()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "10-01-2020",
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text("7:00"),
                      ],
                    )
        ],
      ),
    );
  }

  Widget _progessIndicator(int id) {
    return Container(
      child: Column(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: id == 1
                ? HexColor("#0D4BA7")
                : id == 2 ? HexColor("#0D4BA7") : Colors.grey,
            radius: 6,
          ),
          id == 4
              ? Container()
              : Container(
                  width: 1,
                  height: 40,
                  color: id == 1
                      ? HexColor("#0D4BA7")
                      : id == 2 ? HexColor("#0D4BA7") : Colors.grey),
        ],
      ),
    );
  }

  Widget _receivedOrderDetails(context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              _orderDetailLine("Order #", "CK12FGH"),
              _orderDetailLine("Placed on    ", "10-01-2020"),
              _orderDetailLine("Received on", "20-01-2020"),
              _product(),
              Container(
                margin: EdgeInsets.only(right: 10, top: 10, bottom: 10),
                alignment: Alignment.centerRight,
                child: Text(
                  " Total  \$924",
                  style: TextStyle(color: HexColor("#334765"), fontSize: 19),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                child: BottomButton(
                  name: "LEAVE FEED BACK",
                  customColor: true,
                  color: HexColor("#FF4747"),
                  ontap: () {
                    _showModalBottomSheet(
                      context,
                    );
                  },
                ),
              )
            ],
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
                _orderDetailLine("Order #", "CK12FGH"),
                _orderDetailLine("Placed on    ", "10-01-2020"),
                _orderDetailLine("Received on", "20-01-2020"),
                _product(),
                _divider(),
                _rate(),
                _divider(),
                _title("Write a Review"),
                _textFormField(
                  "Write here...",
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: 20, right: 20, top: 14, bottom: 0.0),
                  child: BottomButton(
                    name: "Send Feed Back",
                    ontap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget _divider() {
    return Container(
      width: double.infinity,
      height: 1,
      color: Colors.grey,
    );
  }

  Widget _rate() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "How would you rate this product?",
            style: blackbold.copyWith(height: 1.5, fontSize: 18),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(
                  Icons.star_border,
                  color: HexColor("#707070"),
                  size: 24,
                ),
                Icon(
                  Icons.star_border,
                  color: HexColor("#707070"),
                  size: 24,
                ),
                Icon(
                  Icons.star_border,
                  color: HexColor("#707070"),
                  size: 24,
                ),
                Icon(
                  Icons.star_border,
                  color: HexColor("#707070"),
                  size: 24,
                ),
                Icon(
                  Icons.star_border,
                  color: HexColor("#707070"),
                  size: 24,
                ),
                SizedBox(
                  width: 4,
                ),
              ],
            ),
          ])
        ],
      ),
    );
  }

  Widget _textFormField(String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: TextFormField(
        keyboardType: TextInputType.multiline,
        maxLines: 5,
        decoration: InputDecoration(
            isDense: true,
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            hintText: "$text",
            hintStyle: TextStyle(
              fontSize: 12,
              fontFamily: "Roboto",
              color: HexColor("#9E9E9E"),
              fontWeight: FontWeight.bold,
            )),
      ),
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
}
