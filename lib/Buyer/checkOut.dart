import 'package:flutter/material.dart';
import 'package:transact/AppBar.dart';
import 'package:transact/Buyer/buyerPaymentSelection.dart';
import 'package:transact/utils/bottomButton.dart';
import 'package:transact/utils/routes.dart';
import 'package:transact/utils/utils.dart';

class CheckOut extends StatefulWidget {
  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  var headingFont =
      TextStyle(color: HexColor("#42AFC9"), fontSize: 15, fontFamily: "Roboto");
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor("#F5F7FA"),
        bottomNavigationBar: _bottomBar(),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: CustomeAppBar(
            title: "Check Out",
            homepage: false,
          ),
        ),
        body: Column(
          children: <Widget>[_buyerInfo(), _deliveryOptions(), _voucher()],
        ),
      ),
    );
  }

  Widget _bottomBar() {
    return Container(
      height: MediaQuery.of(context).size.height * .08,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: "Total\n",
                      style: TextStyle(
                          fontSize: 15,
                          color: HexColor("#3B444B"),
                          fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: "\$9024",
                      style: TextStyle(
                          fontSize: 12,
                          color: HexColor("#3B444B"),
                          fontWeight: FontWeight.bold))
                ]),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              width: MediaQuery.of(context).size.width / 3,
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
              child: BottomButton(
                name: "Proceed to Pay",
                customColor: true,
                color: HexColor("#FF6D2B"),
                ontap: () {
                  AppRoutes.push(context, BuyerPaymentSelection());
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buyerInfo() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 20,
                    width: 20,
                    child: Image.asset("images/location.png"),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Text(
                    "John doe",
                    textAlign: TextAlign.start,
                    style: headingFont,
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                        child: Text(
                      "EDIT",
                      style: headingFont.copyWith(fontSize: 17),
                    )),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 40, right: 10, top: 10),
            child: Text(
                "Address Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 5),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(),
                ),
                Expanded(
                  flex: 6,
                  child: Text(
                    "Bill the Same Address",
                    textAlign: TextAlign.start,
                    style: headingFont,
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                        child: Text(
                      "EDIT",
                      style: headingFont.copyWith(fontSize: 17),
                    )),
                  ),
                )
              ],
            ),
          ),
          _textField("images/email.png", "johndoe@mail.com", 1),
          _textField("images/phone.png", "+920000073642", 2)
        ],
      ),
    );
  }

  Widget _deliveryOptions() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 0.0),
      margin: EdgeInsets.only(
        top: 5,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Text("Delivery Options", style: headingFont)),
          Row(
            children: <Widget>[
              Expanded(
                child: _optionCard(1),
              ),
              Expanded(
                child: _optionCard(2),
              ),
              Expanded(
                child: _optionCard(3),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _optionCard(int id) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3, vertical: 5),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(10),
        color: HexColor("#FAFAFA"),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            id == 1
                ? "Seller Delivery"
                : id == 2 ? "Online Delivery" : "Self Pickup",
            style: headingFont.copyWith(color: Colors.black),
          ),
          id == 3
              ? Container(
                  child: Text(
                    "You can pick your order",
                    style:
                        headingFont.copyWith(color: Colors.black, fontSize: 12),
                  ),
                )
              : Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 5),
                        height: 17,
                        width: 17,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue,
                        ),
                        padding: EdgeInsets.all(1),
                        child: Icon(
                          Icons.check,
                          size: 15,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "\$25",
                        style: headingFont.copyWith(
                            color: Colors.black, fontSize: 12),
                      )
                    ],
                  ),
                ),
          id == 3
              ? Container(
                  child: Text(
                    "any time",
                    style:
                        headingFont.copyWith(color: Colors.black, fontSize: 12),
                  ),
                )
              : Container(
                  child: Text("Get by 20-28 jan",
                      style: headingFont.copyWith(
                        color: Colors.black,
                        fontSize: 12,
                      )),
                )
        ],
      ),
    );
  }

  Widget _textField(String image, String label, id) {
    return Container(
      margin: EdgeInsets.only(right: 20, top: 5),
      height: 45,
      child: TextFormField(
        decoration: InputDecoration(
          isDense: true,
          icon: image == ""
              ? null
              : Container(
                  height: 45,
                  width: 30,
                  child: Image.asset("$image"),
                ),
          filled: true,
          fillColor: HexColor("#FFFFFF"),
          hintText: "$label",
          hintStyle: TextStyle(
              fontFamily: "CaviarDreams",
              fontSize: 14,
              color: HexColor("#939698")),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(id == 3 ? 4 : 10),
              borderSide: BorderSide(color: HexColor("#707070"))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(id == 3 ? 4 : 10),
              borderSide: BorderSide(width: 1, color: HexColor("#707070"))),
        ),
      ),
    );
  }

  Widget _voucher() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      color: Colors.white,
      padding: EdgeInsets.all(12),
      child: Column(
        children: <Widget>[
          _text("Subtotal (1 item)", "\$9024.99"),
          SizedBox(
            height: 5,
          ),
          _text("Shipping fee", "\$ 15"),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: _textField("", "Enter Voucher Code", 3),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 45,
                    child: BottomButton(
                      name: "Apply",
                      customColor: true,
                      color: HexColor("#E8DDDD"),
                      ontap: () {
                        print("Voucher");
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _text(String text1, String text2) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "$text1",
          style: headingFont.copyWith(color: HexColor("#363636"), fontSize: 14),
        ),
        Text(
          "$text2",
          style: headingFont.copyWith(color: Colors.black, fontSize: 14),
        ),
      ],
    ));
  }
}
