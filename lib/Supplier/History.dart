import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:transact/AppBar.dart';
import 'package:transact/utils/bottomButton.dart';
import 'package:transact/utils/dashedLine.dart';
import 'package:transact/utils/routes.dart';
import 'package:transact/utils/selectDate.dart';
import 'package:transact/utils/tableDataHeader.dart';
import 'package:transact/utils/utils.dart';

class SupplierHistory extends StatefulWidget {
  @override
  _SupplierHistoryState createState() => _SupplierHistoryState();
}

class _SupplierHistoryState extends State<SupplierHistory> {
  List<bool> _selection = [true, false, false];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor("#F5F7FA"),
        bottomNavigationBar: BottomButton(
          name: "Print Receipt",
          image: Image(
            image: AssetImage("images/print.png"),
          ),
          ontap: () {
            print("working");
          },
        ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(110),
          child: CustomeAppBar(
            homepage: false,
            title: "History",
            child: _toggleButtons(),
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              SelectDate(),
              TableDataHeader(
                c1: "Order Number",
                c2: "Date",
                c3: "Transation",
              ),
              Expanded(child: _listData()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _rowText(String text, String textcolor) {
    return Text(
      "$text",
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: textcolor == "white" ? Colors.white : Colors.black),
    );
  }

////////////////////////////  List to be implemented ////////////////////

  Widget _listData() {
    return GestureDetector(
      onTap: () {
        AppRoutes.push(context, SalesHistory());
      },
      child: Container(
        // height: MediaQuery.of(context).size.height * .6,
        decoration: BoxDecoration(),
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: _selection[0] ? 22 : _selection[1] ? 5 : 8,
          itemBuilder: (context, int index) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 2),
              height: MediaQuery.of(context).size.height * 0.05,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                children: <Widget>[
                  Expanded(child: _rowText("00136", "")),
                  Expanded(child: _rowText("12/01/2020", "")),
                  Expanded(child: _rowText("\$350", "")),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _toggleButtons() {
    return Container(
      alignment: Alignment.center,
      height: 40,
      width: MediaQuery.of(context).size.width * .7,
      child: ToggleButtons(
        fillColor: Colors.white,
        borderColor: Colors.white,
        selectedBorderColor: Colors.white,
        borderWidth: 1.5,
        borderRadius: BorderRadius.circular(3),
        isSelected: _selection,
        children: <Widget>[
          Container(
              margin: EdgeInsets.symmetric(horizontal: 14),
              child: Text(
                "  Sales ",
                style: TextStyle(
                  fontSize: 14,
                  color: _selection.elementAt(0) == true
                      ? Colors.black
                      : Colors.white,
                ),
                textAlign: TextAlign.center,
              )),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 17),
              child: Text(
                "Purchase",
                style: TextStyle(
                  fontSize: 14,
                  color: _selection.elementAt(1) == true
                      ? Colors.black
                      : Colors.white,
                ),
                textAlign: TextAlign.center,
              )),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Transaction",
                style: TextStyle(
                  fontSize: 14,
                  color: _selection.elementAt(2) == true
                      ? Colors.black
                      : Colors.white,
                ),
                textAlign: TextAlign.center,
              ))
        ],
        onPressed: (int index) {
          setState(() {
            _selection[index] = !_selection[index];
          });
          for (int buttonIndex = 0;
              buttonIndex < _selection.length;
              buttonIndex++) {
            if (buttonIndex == index) {
              _selection[buttonIndex] = true;
            } else {
              _selection[buttonIndex] = false;
            }
          }
        },
      ),
    );
  }
}

class SalesHistory extends StatefulWidget {
  @override
  _SalesHistoryState createState() => _SalesHistoryState();
}

class _SalesHistoryState extends State<SalesHistory> {
  var style = TextStyle(
      fontFamily: "CaviarDreams", fontSize: 16, fontWeight: FontWeight.bold);
  var style2 = TextStyle(
      fontFamily: "CaviarDreams",
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: HexColor("#6B6B6B"));
  var formattedTime = new DateFormat("dd-MM-yyyy").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomButton(
          name: "Print Receipt",
          image: Image(
            image: AssetImage("images/print.png"),
          ),
          ontap: () {
            print("working");
          },
        ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: CustomeAppBar(
            title: "Sales History",
            homepage: false,
          ),
        ),
        body: Column(
          children: <Widget>[
            _orderNumber(),
            _orderDetails(),
          ],
        ),
      ),
    );
  }

  Widget _orderNumber() {
    var style = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
    var style2 = TextStyle(
        fontSize: 12, fontWeight: FontWeight.bold, color: HexColor("#6B6B6B"));
    return Container(
        margin: EdgeInsets.all(10),
        color: Colors.white,
        padding: EdgeInsets.all(10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: Text("$formattedTime",
                    style: TextStyle(color: HexColor("#9E9E9E"), fontSize: 12)),
              ),
              Text(
                "Order #  CK1FF25",
                style: style,
              ),
              Text(
                "by john Doe",
                style: style2,
              ),
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
            ]));
  }

  Widget _orderDetails() {
    return Container(
        margin: EdgeInsets.all(10),
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
              _divider(),
              Container(
                alignment: Alignment.bottomRight,
                margin: EdgeInsets.symmetric(vertical: 5),
                child: Text("Sub Total   \$924",
                    style: style.copyWith(color: HexColor("#3B444B"))),
              ),
              MySeparator(),
              Container(
                alignment: Alignment.bottomRight,
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text("Total   \$924",
                    style: style.copyWith(color: HexColor("#3B444B"))),
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
}
