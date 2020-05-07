import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:transact/AppBar.dart';
import 'package:transact/utils/utils.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  //////////////////////////font styles/////////////////////////
  var style1 = TextStyle(
      fontFamily: "CaviarDreams",
      fontSize: 16,
      color: HexColor("#3B444B"),
      fontWeight: FontWeight.bold);
  var stylesmall = TextStyle(
      fontFamily: "CaviarDreams",
      fontSize: 10,
      color: HexColor("#6B6B6B"),
      fontWeight: FontWeight.bold);
  var style3 = TextStyle(
      fontFamily: "CaviarDreams",
      fontSize: 12,
      color: HexColor("#6B6B6B"),
      fontWeight: FontWeight.bold);
  //////////////////////////////////////////////////////////////

  var formattedDate = DateFormat("dd-mm-yyyy").format(DateTime.now());

  List<bool> _selection = [true,false];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: HexColor("#F5F7FA"),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: CustomeAppBar(
          title: "Notification",
          type: 'Supplier',
          child: _toggleButtons(),
        ),
      ),
      body: _listBuilder(),
    ));
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
              margin: EdgeInsets.symmetric(horizontal: 17),
              child: Text(
                "Notification",
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
                " Reminder ",
                style: TextStyle(
                  fontSize: 14,
                  color: _selection.elementAt(1) == true
                      ? Colors.black
                      : Colors.white,
                ),
                textAlign: TextAlign.center,
              )),
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

  Widget _listData() {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                _selection[0] ? "New Order" : "Reminder",
                style: style1,
              ),
              Text(
                "$formattedDate",
                style: stylesmall,
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 2),
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur "
              "adipiscing elit, sed do eiusmod tempor "
              "incididunt ut labore et dolore magna aliqua. ",
              style: style3,
            ),
          ),
        ],
      ),
    );
  }

  Widget _listBuilder() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return _listData();
      },
    );
  }
}
