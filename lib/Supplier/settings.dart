import 'package:flutter/material.dart';
import 'package:transact/utils/routes.dart';
import 'package:transact/utils/utils.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool switchControl = false;
  var style1 =
      TextStyle(fontFamily: "CaviarDreams", fontSize: 20, color: Colors.white);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 3.2,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(bottom: 20),
              padding: EdgeInsets.all(25),
              decoration: BoxDecoration(color: HexColor("#3B444B"), boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 20.0,
                )
              ]),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(10),
                          child: CircleAvatar(
                            backgroundImage: AssetImage("images/myImage.jpg"),
                            radius: 30,
                          ),
                        ),
                        Text(
                          "John Doe",
                          style: style1,
                        ),
                        Text(
                          "Johndoe@mail.com",
                          style: style1.copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  _userStatus(),
                  _otherInfo(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _userStatus() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "User Status",
                textAlign: TextAlign.start,
                style: style1.copyWith(
                    fontSize: 18, fontFamily: "antipasto", color: Colors.black),
              ),
              Row(
                children: <Widget>[
                  Text(
                    "Trial 30 days",
                    style: style1.copyWith(
                        color: HexColor("#6D6D6D"), fontSize: 14),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .1,
                  ),
                  Text(
                    "(25 days left)",
                    style: style1.copyWith(
                        color: HexColor("#6D6D6D"), fontSize: 10),
                  )
                ],
              )
            ],
          ),
          InkWell(
            onTap: () {
              print("working");
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              height: MediaQuery.of(context).size.height * .05,
              width: MediaQuery.of(context).size.width * .22,
              decoration: BoxDecoration(
                color: HexColor("#DB2B42"),
                borderRadius: BorderRadius.circular(7),
              ),
              child: Text(
                "Subscribe",
                style: style1.copyWith(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _otherInfo() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Push Notification",
                style: style1.copyWith(color: Colors.black),
              ),
              Switch(
                onChanged: toggleSwitch,
                value: switchControl,
              )
            ],
          ),
          InkWell(
            onTap: () {
              AppRoutes.push(context, Referral());
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Supplier ID & Referral",
                  style: style1.copyWith(color: Colors.black),
                ),
                Icon(Icons.arrow_forward_ios,
                    color: HexColor("#3B444B"), size: 20),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.symmetric(vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Account",
                    style: style1.copyWith(color: Colors.black),
                  ),
                ),
                _buildRow("images/userman.png", "Personal Information"),
                _buildRow("images/cards.png", "Bank Account Details"),
                _buildRow("images/cart4.png", "Shop Details"),
              ],
            ),
          )
        ],
      ),
    );
  }

  void toggleSwitch(bool value) {
    switchControl == false
        ? setState(() {
            switchControl = true;
            print("true");
          })
        : setState(() {
            switchControl = false;
            print("false");
          });
  }

  Widget _buildRow(String image, String text) {
    return InkWell(
      onTap: () {
        print("$text");
      },
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                      height: 20,
                      width: 20,
                      child: Image.asset("$image"),
                    ),
                    Text("$text",
                        style: style1.copyWith(
                            fontSize: 15,
                            fontFamily: "CaviarDreams",
                            color: HexColor("#3B444B"))),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios,
                  color: HexColor("#3B444B"), size: 20),
            ],
          )),
    );
  }
}

class Referral extends StatefulWidget {
  @override
  _ReferralState createState() => _ReferralState();
}

class _ReferralState extends State<Referral> {
  var style1 =
      TextStyle(fontFamily: "CaviarDreams", fontSize: 18, color: Colors.white);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 3.2,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(bottom: 20),
              padding: EdgeInsets.all(25),
              decoration: BoxDecoration(color: HexColor("#3B444B"), boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 20.0,
                )
              ]),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.all(15),
                      child: CircleAvatar(
                        backgroundImage: AssetImage("images/myImage.jpg"),
                        radius: 32,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 2, bottom: 10),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Supplier ID",
                      style: style1.copyWith(
                          fontFamily: "antipasto",
                          fontSize: 22,
                          color: HexColor("#2E5A7D")),
                    ),
                  ),
                  _text("Supplier ID *"),
                  _textField("000 111 222", 1),
                  _text("Referral code and share link *"),
                  _textField("johndoe123", 2)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _textField(String hint, int id) {
    return TextField(
      textAlign: TextAlign.center,
      decoration: InputDecoration(
          isDense: true,
          prefixIcon: id == 2
              ? Container(
                  decoration: BoxDecoration(
                      color: HexColor("#3B444B"),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8))),
                  child: Container(
                    height: 20,
                    width: 20,
                    padding: EdgeInsets.all(10),
                    child: Image.asset("images/link.png"),
                  ),
                )
              : null,
          hintText: "$hint",
          hintStyle: style1.copyWith(fontSize: 12, color: Colors.grey),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
    );
  }

  Widget _text(String text) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 2),
      alignment: Alignment.centerLeft,
      child: Text(
        "$text",
        style: style1.copyWith(color: Colors.black, fontSize: 14),
      ),
    );
  }
}
