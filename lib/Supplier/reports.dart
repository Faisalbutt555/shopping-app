import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:transact/AppBar.dart';
import 'package:transact/utils/bottomButton.dart';
import 'package:transact/utils/fonts.dart';
import 'package:transact/utils/graphs.dart';
import 'package:transact/utils/selectDate.dart';
import 'package:transact/utils/togglebuttons.dart';
import 'package:transact/utils/utils.dart';

class Reports extends StatefulWidget {
  @override
  _ReportsState createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  List<String> _catagory = [
    'Transaction',
    'Profit/Loss',
    'Sale Purchase',
    'Total Expense'
  ];

  String _selectedCatagory;
  String _value = 'Select Date';
  TextEditingController _dateController;
  List<bool> _selection = [true, false, false, false];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: HexColor("#F5F7FA"),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(120),
            child: CustomeAppBar(
              homepage: false,
              title: "Reports",
              suffixIcon: "images/applyfilter.png",
              suffix: true,
              suffixOnTap: () {
                _settingModalBottomSheet(context);
              },
              child: ToggleButton(
                isSelected: _selection,
                child1Title: "Today",
                child2Title: "Weekly",
                child3Title: "Monthly",
                child4Title: "Products",
                buttonCount: 4,
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
              ),
            ),
          ),
          body: Column(
            children: <Widget>[
              _salenPurchase(),
              _selection[0]
                  ? Column(children: <Widget>[
                      BarChartSample5(),
                      _orderReceive("Order Received", "149"),
                      _orderReceive("Order Sent", "691"),
                    ])
                  : Column(children: <Widget>[
                      _orderReceive("Order Received", "149"),
                      _orderReceive("Order Sent", "691"),
                      BarChartSample5()
                    ])
            ],
          )),
    );
  }

  Widget _salenPurchase() {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _amountButton("Total Sales", "images/hand.png"),
          _amountButton("Purchase", "images/cart.png"),
        ],
      ),
    );
  }

  Widget _amountButton(String text, String image) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: MediaQuery.of(context).size.height * .2,
        width: MediaQuery.of(context).size.width / 2.9,
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
            boxShadow: [
              new BoxShadow(
                color: Colors.grey,
                blurRadius: 5.0,
              ),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(color: HexColor("#77E086"), width: 6),
                shape: BoxShape.circle,
              ),
              child: Image(
                height: 32.0,
                width: 32.0,
                image: AssetImage("$image"),
              ),
            ),
            Text(
              "$text",
              textAlign: TextAlign.center,
              style: style.copyWith(fontSize: 16),
            ),
            Text("\$999",
                textAlign: TextAlign.center,
                style: style.copyWith(color: HexColor("#6B8995")))
          ],
        ),
      ),
    );
  }

  Widget _orderReceive(String text, String number) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2),
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Image(
              height: 30.0,
              width: 30.0,
              image: AssetImage("images/cart.png"),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              "$text",
              style: style.copyWith(fontFamily: "CaviarDreams", fontSize: 18),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 17),
              decoration: BoxDecoration(
                  color: HexColor("#D6D6D6"),
                  borderRadius: BorderRadius.circular(10)),
              height: 32.0,
              width: 32.0,
              child: Text(
                "$number",
                style: style.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: HexColor("#3B444B")),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext bc) {
          return Container(
            padding: EdgeInsets.only(top: 20, left: 15, right: 15),
            height: MediaQuery.of(context).size.height - 100,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(35),
                    topLeft: Radius.circular(35))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Report Filter",
                  style: TextStyle(fontSize: 18),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Select Date",
                        style:
                            TextStyle(fontSize: 13, color: HexColor("#3B444B")),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 7,
                            child: SizedBox(
                              child: _datePicker(),
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: Text(
                                "to",
                                textAlign: TextAlign.center,
                              )),
                          Expanded(
                            flex: 7,
                            child: SizedBox(
                              child: _datePicker(),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: HexColor("#707070")),
                                  borderRadius: BorderRadius.circular(2)),
                              child: Image(
                                color: HexColor("#3B444B"),
                                image: AssetImage("images/applyfilter.png"),
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: _textField(),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: 10),
                              padding: EdgeInsets.symmetric(vertical: 10),
                              
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: HexColor("#707070")
                                      )
                                      ),
                              child: DropdownButton(
                                isDense: true,
                                isExpanded: true,
                                icon: Container(
                                  alignment: Alignment.centerRight,
                                  child: Icon(Icons.arrow_drop_down),
                                ),
                                hint: Text(
                                    'Please choose a Catagory'), // Not necessary for Option 1
                                value: _selectedCatagory,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedCatagory = newValue;
                                  });
                                },
                                items: _catagory.map((catagory) {
                                  return DropdownMenuItem(
                                    child: new Text(catagory),
                                    value: catagory,
                                  );
                                }).toList(),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: BottomButton(
                    name: "Search",
                    ontap: (){
                      Navigator.pop(context);

                    },
                  ),
                )
              ],
            ),
          );
        });
  }

  Widget _datePicker() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 4),
      height: MediaQuery.of(context).size.height * 0.06,
      decoration: BoxDecoration(),
      child: TextFormField(
        showCursor: false,
        autofocus: false,
        onTap: () {
          _selectDate();
        },
        readOnly: true,
        controller: _dateController,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
            isDense: true,
            filled: true,
            hintText: _value,
            // labelText: "Date",
            fillColor: Colors.white,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3),
                borderSide: BorderSide())),
      ),
    );
  }

  Future _selectDate() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2012),
        lastDate: new DateTime.now());
    if (picked != null)
      setState(() {
        _value = DateFormat("dd-MM-yyyy").format(picked).toString();
      });
  }

  Widget _textField() {
    return Container(
      height: 45,
      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 0.0),
      child: TextFormField(
          onFieldSubmitted: (String text) {
            print("$text");
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: HexColor("#FFFFFF"),
            hintText: "Search here",
            hintStyle: TextStyle(fontSize: 14, color: Colors.black54),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2.0),
                borderSide: BorderSide(color: HexColor("#707070"))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2.0),
                borderSide: BorderSide(width: 1, color: HexColor("#707070"))),
            prefixIcon: Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Icon(Icons.search)),
          )),
    );
  }
}
