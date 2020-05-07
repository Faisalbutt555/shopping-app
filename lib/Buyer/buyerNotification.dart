import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:transact/AppBar.dart';
import 'package:transact/utils/utils.dart';

class BuyerNotifications extends StatefulWidget {
  @override
  _BuyerNotificationsState createState() => _BuyerNotificationsState();
}

class _BuyerNotificationsState extends State<BuyerNotifications> {
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

  List<bool> _selection = [true, false];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: HexColor("#F5F7FA"),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: CustomeAppBar(
          title: "Notification",
        ),
      ),
      body: _listBuilder(),
    ));
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
                "Purchase Confirmation",
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
