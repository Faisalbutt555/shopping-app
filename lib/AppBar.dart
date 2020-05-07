import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:transact/Supplier/notifications.dart';
import 'package:transact/utils/routes.dart';
import 'package:transact/utils/utils.dart';
import 'package:flutter/services.dart';

import 'Model/UserModel.dart';

class CustomeAppBar extends StatefulWidget {
  bool homepage;
  String type;
  String title;
  Widget child;
  String suffixIcon;
  bool suffix;
  String bottomIcon1;
  String bottomIcon2;
  Function bottomIcon1OnTap;
  Function bottomIcon2OnTap;

  Function suffixOnTap;

  CustomeAppBar({
    Key key,
    this.homepage,
    this.type,
    this.child,
    this.title,
    this.suffixIcon,
    this.suffix,
    this.suffixOnTap,
    this.bottomIcon1,
    this.bottomIcon2,
    this.bottomIcon1OnTap,
    this.bottomIcon2OnTap,
  }) : super(key: key);
  @override
  _CustomeAppBarState createState() => _CustomeAppBarState();
}

class _CustomeAppBarState extends State<CustomeAppBar> {
  String barcode = "Search here";

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      height: 150,
      decoration: BoxDecoration(
          color: HexColor("#3B444B"),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(32),
              bottomRight: Radius.circular(32))),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        User.userData.filter=false;
                      });
                      widget.homepage == true
                          ? Scaffold.of(context).openDrawer()
                          : Navigator.pop(context);
                    },
                    child: widget.homepage == true
                        ? Image(
                            height: 16,
                            width: 15,
                            image: AssetImage("images/menu.png"),
                          )
                        : Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                widget.homepage == true
                    ? Expanded(
                        child: GestureDetector(
                          onTap: widget.suffix == true
                              ? widget.suffixOnTap
                              : () {
                                  AppRoutes.push(context, Notifications());
                                },
                          child: Image(
                            height: 20,
                            width: 22,
                            image: AssetImage("images/bell.png"),
                          ),
                        ),
                      )
                    : widget.suffix == true
                        ? Expanded(
                            child: GestureDetector(
                              onTap: widget.suffixOnTap,
                              child: Image(
                                height: 20,
                                width: 22,
                                image: AssetImage(widget.suffixIcon),
                              ),
                            ),
                          )
                        : Expanded(child: Container()),
              ],
            ),
          ),
          widget.homepage == true
              ? Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: widget.type == "Buyer"
                            ? widget.bottomIcon1OnTap
                            : () {
                                scan();
                              },
                        child: Image(
                          height: widget.type == "Buyer" ? 24 : 34,
                          width: widget.type == "Buyer" ? 22 : 30,
                          color: Colors.white,
                          image: AssetImage(widget.type == "Buyer"
                              ? widget.bottomIcon1
                              : "images/barcode.png"),
                        ),
                      ),
                      _textField("$barcode"),
                      widget.type == "Buyer"
                          ? GestureDetector(
                              onTap: widget.bottomIcon2OnTap,
                              child: Image(
                                height: 34,
                                width: 30,
                                color: Colors.white,
                                image: AssetImage(widget.bottomIcon2),
                              ))
                          : Container()
                    ],
                  ),
                )
              : Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: widget.child,
                ),
        ],
      ),
    );
  }

  Widget _textField(String label) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.5,
      height: 45,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: TextFormField(
          onFieldSubmitted: (String text) {
            print("$text");
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: HexColor("#FFFFFF"),
            hintText: "$label",
            hintStyle: TextStyle(fontSize: 14, color: Colors.black54),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: HexColor("#707070"))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(width: 1, color: HexColor("#707070"))),
            prefixIcon: Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                child: Icon(Icons.search)),
          )),
    );
  }

  Future scan() async {
    try {
      String barcode;
      await BarcodeScanner.scan().then((onValue) {
        setState(() {
          barcode = onValue.toString();
        });
      }).catchError((onError) {
        print(onError);
      });
      setState(() => this.barcode = barcode);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          this.barcode = 'camera permission not granted!';
        });
      } else {
        setState(() => this.barcode = 'Unknown error: $e');
      }
    } on FormatException {
      setState(() => this.barcode = '(User returned)');
    } catch (e) {
      setState(() => this.barcode = 'Unknown error: $e');
    }
  }
}
