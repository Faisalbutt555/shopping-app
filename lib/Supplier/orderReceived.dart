import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:transact/AppBar.dart';

import 'package:transact/utils/togglebuttons.dart';
import 'package:transact/utils/utils.dart';

class OrderReceived extends StatefulWidget {
  @override
  _OrderReceivedState createState() => _OrderReceivedState();
}

class _OrderReceivedState extends State<OrderReceived> {
  ///////////// font style///////////////////////////////
  var style = TextStyle(
      fontFamily: "CaviarDreams", fontSize: 16, fontWeight: FontWeight.bold);
  var style2 = TextStyle(
      fontFamily: "CaviarDreams",
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: HexColor("#6B6B6B"));
  ////////////////////////////////////////////////////////

  var formattedDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
  List<bool> _selection = [true, false, false];
  bool order = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor("#F5F7FA"),
        bottomNavigationBar: order == true && !_selection[2] ? _bottom() : null,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(order == false ? 110 : 70),
          child: CustomeAppBar(
            homepage: false,
            title: order == false ? "Received Order" : "Order",
            child: order == false
                ? ToggleButton(
                    isSelected: _selection,
                    child1Title: "Pending",
                    child2Title: "Received",
                    child3Title: "Delivered",
                    buttonCount: 3,


                    onPress: (int index) {
                      setState(() {
                        _selection[index] = !_selection[index];
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
                  )
                : Container(),
          ),
        ),
        body: order == false
            ? Container(
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return _orderNumber();
                  },
                ))
            : _order(),
      ),
    );
  }

  Widget _orderNumber() {
    return InkWell(
      onTap: () {
        setState(() {
          order = true;
        });
      },
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 7),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: Text("$formattedDate",
                      style:
                          TextStyle(color: HexColor("#9E9E9E"), fontSize: 12)),
                ),
                Text(
                  "Order #  CK1FF25",
                  style: style,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "by john Doe",
                      style: style2,
                    ),
                    Text(
                      _selection[1]
                          ? "Approved"
                          : _selection[2] ? "Delivered" : "",
                      style: style2.copyWith(
                          color: _selection[1]
                              ? HexColor("#078703")
                              : HexColor("#FF0000")),
                    )
                  ],
                ),
                _selection[2]
                    ? Text(
                        "Delivery Date : 20-01-2020",
                        style: style2,
                      )
                    : Container(),
                Row(children: <Widget>[
                  Text(
                    "Payment Method",
                    style: style2,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "COD",
                    style: style,
                  )
                ]),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text("\$945", style: style),
                ),
              ])),
    );
  }

  Widget _order() {
    return Container(
      child: Column(
        children: <Widget>[_orderNumber(), _orderDetails(), _customerDetails()],
      ),
    );
  }

  Widget _orderDetails() {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
        color: Colors.white,
        padding: EdgeInsets.all(10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Order Detail",
                style: style.copyWith(color: HexColor("#6B6B6B")),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Wrap(
                      children: <Widget>[
                        Image(
                          height: MediaQuery.of(context).size.height * .14,
                          width: MediaQuery.of(context).size.width * .3,
                          image: AssetImage("images/iphone.png"),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "iphone 8",
                              style: style.copyWith(color: HexColor("#6B6B6B")),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              "1 x \$200",
                              textAlign: TextAlign.start,
                              style: style2,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Text(
                    "\$968",
                    style: style,
                  ),
                ],
              ),
              _divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Wrap(
                      children: <Widget>[
                        Image(
                          height: MediaQuery.of(context).size.height * .14,
                          width: MediaQuery.of(context).size.width * .3,
                          image: AssetImage("images/iphone.png"),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "iphone 8",
                              style: style.copyWith(color: HexColor("#6B6B6B")),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              "1 x \$200",
                              textAlign: TextAlign.start,
                              style: style2,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Text(
                    "\$968",
                    style: style.copyWith(color: HexColor("#3B444B")),
                  ),
                ],
              ),
            ]));
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      height: 1,
      color: HexColor("#707070"),
    );
  }

  Widget _customerDetails() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 1),
              child: Text(
                "Customer Details",
                style: style2.copyWith(fontSize: 16),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "John Doe",
                    style: style2.copyWith(
                        fontFamily: "antipasto",
                        fontSize: 18,
                        color: Colors.black),
                  ),
                  Text(
                    "Customer Name",
                    style: style2.copyWith(fontSize: 12),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "ABN",
                    style: style2.copyWith(
                        fontFamily: "antipasto",
                        fontSize: 18,
                        color: Colors.black),
                  ),
                  Text(
                    "Delivery",
                    style: style2.copyWith(fontSize: 12),
                  ),
                ],
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              children: <Widget>[
                Image(
                    height: 20,
                    width: 20,
                    image: AssetImage("images/call.png")),
                Text("  +91111111111111"),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              children: <Widget>[
                Image(
                    height: 20, width: 20, image: AssetImage("images/msg.png")),
                Text("  Chat"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottom() {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height * .08,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _button("Cancel Order"),
          _button(_selection[0] ? "Accept Order" : "Deliver Order")
        ],
      ),
    );
  }

  Widget _button(String name) {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(left: 10, right: 10),
      padding: EdgeInsets.symmetric(horizontal: 30),
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: name == "Cancel Order" ? Colors.white70 : HexColor("#3B444B")),
      child: GestureDetector(
        onTap: () {
          setState(() {
            name == "Cancel Order" ? order = false : null;
          });
        },
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Text(
                "$name",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    color:
                        name == "Cancel Order" ? Colors.black : Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
