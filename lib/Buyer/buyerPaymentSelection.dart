import 'package:flutter/material.dart';
import 'package:transact/AppBar.dart';
import 'package:transact/Buyer/buyerHome.dart';
import 'package:transact/utils/bottomButton.dart';
import 'package:transact/utils/routes.dart';
import 'package:transact/utils/utils.dart';

class BuyerPaymentSelection extends StatefulWidget {
  @override
  _BuyerPaymentSelectionState createState() => _BuyerPaymentSelectionState();
}

class _BuyerPaymentSelectionState extends State<BuyerPaymentSelection> {
  String _radioValue;
  String choice;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor("#F5F7FA"),
        bottomNavigationBar: Container(
          height: MediaQuery.of(context).size.height * .06,
          margin: EdgeInsets.symmetric(horizontal: 60, vertical: 5),
          child: BottomButton(
            name: "Proceed",
            customColor: true,
            color: HexColor("#FF6D2B"),
            ontap: () {
              _showDialog();
            },
          ),
        ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: CustomeAppBar(
            title: "Check Out",
            homepage: false,
          ),
        ),
        body: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: <Widget>[
              _eWallet(),
              _paymentMethod(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _eWallet() {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        children: <Widget>[
          _paymentOption("", "e-Wallet"),
          _paymentOption("images/van.png", "Cash On Delivery")
        ],
      ),
    );
  }

  Widget _paymentMethod() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Text(
              "Payment Method",
              style: TextStyle(fontSize: 18),
            ),
          ),
          _paymentOption(
            "images/master.png",
            "Master Card",
          ),
          _paymentOption(
            "images/visa.png",
            "Visa Card",
          ),
          _paymentOption("images/paypal.png", "PayPal")
        ],
      ),
    );
  }

  Widget _paymentOption(
    String image,
    String text,
  ) {
    return Container(
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: image == ""
                ? Container()
                : Container(
                    height: 50,
                    width: 50,
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                    margin: EdgeInsets.symmetric(horizontal: 0),
                    child: Image.asset("$image"),
                  ),
          ),
          Expanded(
              flex: image == "" ? 5 : 5,
              child: image == ""
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            "$text",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            "Select to top-up pay",
                            style: TextStyle(fontSize: 12),
                          ),
                        )
                      ],
                    )
                  : Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        "$text",
                        style: TextStyle(fontSize: 16),
                      ),
                    )),
          Expanded(
            flex: image == "" ? 2 : 1,
            child: image == ""
                ? Row(
                    children: <Widget>[
                      Container(
                        child: Text(
                          "\$50",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Radio(
                          activeColor: Colors.black,
                          value: text,
                     //     visualDensity: VisualDensity.comfortable,
                          groupValue: _radioValue,
                          onChanged: radioButtonChanges),
                    ],
                  )
                : Container(
                    child: Radio(
                        activeColor: Colors.black,
                        value: text,
                       // visualDensity: VisualDensity.comfortable,
                        groupValue: _radioValue,
                        onChanged: radioButtonChanges),
                  ),
          )
        ],
      ),
    );
  }

  ////////////////////////////////////// methods ///////////////////////////////////
  ///
  void _showDialog() {
    showDialog(
        context: context,
        child: AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          contentPadding: EdgeInsets.only(top: 10.0),
          content: Container(
            width: MediaQuery.of(context).size.width / 1.2,
            height: MediaQuery.of(context).size.height * .2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Cogratulations",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                  height: 5.0,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  alignment: Alignment.center,
                  child: Text("You have successfully Placed an Order.",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 16, fontFamily: "CaviarDreams")),
                ),
                GestureDetector(
                  onTap: () {
                    AppRoutes.replace(context, BuyerHome());
                  },
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * .06,
                    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                    decoration: BoxDecoration(
                      color: HexColor("#3B444B"),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12.0),
                          bottomRight: Radius.circular(12.0)),
                    ),
                    child: Text(
                      "MORE ORDERS",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void radioButtonChanges(String value) {
    setState(() {
      _radioValue = value;

      debugPrint(_radioValue); //Debug the choice in console
    });
  }

  /////////////////////////////////////////////////////////////////////////
}
