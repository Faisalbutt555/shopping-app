import 'package:flutter/material.dart';
import 'package:transact/AppBar.dart';
import 'package:transact/utils/utils.dart';

class MyAccount extends StatefulWidget {
  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  var style1 =
      TextStyle(fontFamily: "CaviarDreams", fontSize: 16, color: Colors.black);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: HexColor("#F5F7FA"),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: CustomeAppBar(
          homepage: false,
          title: "My Account",
          child: _accountInfo(),
        ),
      ),
      body: Column(
        children: <Widget>[_myOrders(),_eWallet()],
      ),
    ));
  }

  Widget _eWallet() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      margin: EdgeInsets.symmetric(vertical: 5),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "E-Wallet",
                style: style1,
              ),
              InkWell(
                  onTap: () {
                    print("Activated");
                  },
                  child: Text(
                    "Activate Now",
                    style: style1.copyWith(
                        decoration: TextDecoration.underline, fontSize: 12),
                  )),
            ],
          ),
          Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 10),
              child: Column(
                children: <Widget>[
                  Text(
                    "\$0",
                    style: style1.copyWith(
                        color: HexColor("#E23737"), fontFamily: "Roboto"),
                  ),
                  Text("Balance", style: style1.copyWith(fontSize: 18)),
                ],
              ))
        ],
      ),
    );
  }

  Widget _myOrders() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      margin: EdgeInsets.symmetric(vertical: 5),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "My Orders",
                style: style1,
              ),
              InkWell(
                  onTap: () {
                    print("Activated");
                  },
                  child: Text(
                    "View All",
                    style: style1.copyWith(
                        decoration: TextDecoration.underline, fontSize: 12),
                  )),
            ],
          ),
        Row(
          children: <Widget>[
            _orderType("images/pay.png", "To Pay"),
             _orderType("images/return.png", "My Return"),
              _orderType("images/cargo.png", "My Cancelation"),

          ],
        )
        ],
      ),
    );
  }

  Widget _orderType(String image, String text) {
    return Container(
      margin: EdgeInsets.only(top: 15, bottom: 15, right: 40),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: (){print("$text");},
                      child: Image(
              height: 50,
              width: 40,
              image: AssetImage("$image"),
            ),
          ),
          Text("$text",style: style1.copyWith(fontSize: 10),),
        ],
      ),
    );
  }
  Widget _accountInfo(){
    return Container(
      margin: EdgeInsets.only(top: 10,left: 20),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10),
            child: CircleAvatar(
              radius: 28,
              backgroundImage: AssetImage("images/myImage.jpg"),
            )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("John Doe",style: style1.copyWith(fontFamily: "ProbaPro",fontSize: 18,color: Colors.white),),
              Text("johndoe@gmail.com ",style: style1.copyWith(fontSize: 12,fontFamily: "ProbaPro",color: Colors.white),),
            ],
          )
        ],
      ),
    );
  }
}
