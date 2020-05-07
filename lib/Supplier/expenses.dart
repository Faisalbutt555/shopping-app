import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:transact/AppBar.dart';
import 'package:transact/Supplier/addExpesnse.dart';

import 'package:transact/utils/bottomButton.dart';
import 'package:transact/utils/routes.dart';
import 'package:transact/utils/utils.dart';

class Expenses extends StatefulWidget {
  @override
  _ExpensesState createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  var style = TextStyle(
      fontFamily: "CaviarDreams", fontSize: 18, fontWeight: FontWeight.bold);
  var formattedDateTime =
      DateFormat("dd-MM-yyyy  hh:mm a").format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: HexColor("#F5F7FA"),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(70),
            child: CustomeAppBar(
              homepage: false,
              title: "Expenses",
            ),
          ),
          bottomNavigationBar: BottomButton(
            name: "+ ADD NEW EXPENSE",
            ontap: () {
              AppRoutes.push(context, AddExpense());
            },
          ),
          body: Container(
            child: _expenseCardList(),
          )),
    );
  }

  Widget _expenseCardList() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return _expensCard();
      },
    );
  }

  Widget _expensCard() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.grey[200],
          blurRadius: 5,
        )
      ]),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topRight,
            child: Text(
              "$formattedDateTime",
              style: style.copyWith(fontSize: 12),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 5, bottom: 5, top: 2),
            child: Text(
              "Expense Name",
              style: style,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 5, bottom: 5, top: 1),
            child: Row(
              children: <Widget>[
                Image(
                  height: MediaQuery.of(context).size.height * .065,
                  width: MediaQuery.of(context).size.width / 5,
                  image: AssetImage("images/blankImage1.png"),
                ),
                SizedBox(
                  width: 3,
                ),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur\nadipiscing"
                  "sed do eiusmod tempor incididunt\n"
                  "labore et dolore magna aliqua.",
                  style: style.copyWith(fontSize: 12),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              "\$25",
              style: style,
            ),
          )
        ],
      ),
    );
  }
}
