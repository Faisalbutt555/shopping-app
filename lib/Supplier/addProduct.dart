import 'dart:io';
import 'dart:ui';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:dashed_container/dashed_container.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:transact/AppBar.dart';
import 'package:transact/utils/bottomButton.dart';
import 'package:transact/utils/utils.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  File _image;

  String barcode = "";
  List<String> _catagory = [
    'Electronics',
    'Garments',
    'Cosmetics',
    'Accessories'
  ];

  List<int> _quantity = [10, 20, 30, 40, 50, 100, 130, 150, 200]; // Option 2
  String _selectedCatagory;
  int _selectedQuantity;
  var formattedTime = new DateFormat("dd-MM-yyyy hh:mm").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor("#F5F7FA"),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: CustomeAppBar(
            homepage: false,
            title: "Add Product",
            suffix: false,
          ),
        ),
        bottomNavigationBar: BottomButton(
          name: "Add Product",
          ontap: () {
            _showDialog();
          },
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                _productDetail(),
                _barCodeSection(),
                _description(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _productDetail() {
    return Container(
      margin: EdgeInsets.all(10),
      color: Colors.white,
      padding: EdgeInsets.all(10),
      //height: MediaQuery.of(context).size.height * .55,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Align(
            alignment: Alignment.topRight,
            child: Text("$formattedTime",
                style: TextStyle(color: HexColor("#9E9E9E"), fontSize: 12)),
          ),
          _title("Product Name"),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 40,
            child: TextFormField(
              cursorColor: HexColor("#9E9E9E"),
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                focusColor: Colors.orange,

                // filled: true,
              ),
            ),
          ),
          _title("Select Catagory"),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 10),
            height: 40,
            child: DropdownButton(
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
          Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _title("Add Quantity"),
                    SizedBox(
                      height: 23,
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      height: 40,
                      child: DropdownButton(
                        isExpanded: true,
                        icon: Container(
                          alignment: Alignment.centerRight,
                          child: Icon(Icons.arrow_drop_down),
                        ),
                        hint: Text('10'),
                        value: _selectedQuantity,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedQuantity = newValue;
                          });
                        },
                        items: _quantity.map((quantity) {
                          return DropdownMenuItem(
                            child: new Text("$quantity"),
                            value: quantity,
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _title("Color"),
                    Container(
                      height: 37,
                      child: TextFormField(
                        decoration: InputDecoration(
                            suffixIcon: Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(),
                          child: Icon(Icons.add),
                        )),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),

          /////////////////////////////////////////////////////////////////

          Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _title("Discount"),
                    Container(child: _textFormField("In Cash"))
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        child: _title("OR")),
                    SizedBox(
                      width: 100,
                      child: Column(
                        children: <Widget>[
                          _title(""),
                          _textFormField("In Precentage")
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _title("After Discount"),
                    _textFormField("\$900"),
                  ],
                ),
              ),
            ],
          ),
          ///////////////////////////////////////////////
          Row(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _title("Discount"),
                    Container(child: _textFormField("Actual Price"))
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        child: _title("")),
                    SizedBox(
                      width: 60,
                      child: Column(
                        children: <Widget>[
                          _title(""),
                          _textFormField("Sale Price")
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.symmetric(vertical: 10),
                height: MediaQuery.of(context).size.height * .14,
                width: MediaQuery.of(context).size.width * .4,
                child: Container(
                    child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                            child: Image(
                          height: MediaQuery.of(context).size.height * .06,
                          width: MediaQuery.of(context).size.width * .19,
                          image: AssetImage("images/blankImage1.png"),
                        )
                            //Image.asset("images/blankImage1.png")
                            ),
                        DashedContainer(
                          dashColor: Colors.black,
                          borderRadius: 1.0,
                          dashedLength: 3.0,
                          blankLength: 2.0,
                          strokeWidth: 1.0,
                          child: Container(
                            height: MediaQuery.of(context).size.height * .06,
                            width: MediaQuery.of(context).size.width * .17,
                            child: Icon(
                              Icons.add,
                              size: 25,
                            ),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        getImage();
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        alignment: Alignment.bottomCenter,
                        height: MediaQuery.of(context).size.height * .04,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.grey, blurRadius: 5)
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Add Image",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _title(String text) {
    return Container(
      padding: text == 'Scan Barcode' ? EdgeInsets.all(5) : null,
      child: Text("$text",
          style: TextStyle(
              color: HexColor("#9E9E9E"),
              fontFamily: 'Roboto',
              fontSize: 12,
              fontWeight: FontWeight.bold)),
    );
  }

  Widget _textFormField(String label) {
    return Container(
      child: TextFormField(
        decoration: InputDecoration(
            hintText: "$label",
            hintStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            )),
      ),
    );
  }

  Widget _barCodeSection() {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 10),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _title("Add Barcode"),
          SizedBox(
            height: 20,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _title("Add Manually"),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * .4,
                        child: _textFormField("0011 3511 0040"))
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        _title("Scan Barcode"),
                        Container(
                          width: 80,
                          height: 25,
                          padding: EdgeInsets.all(2),
                          child: GestureDetector(
                            onTap: () {
                              scan();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(color: Colors.grey, blurRadius: 5)
                                  ]),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image(
                                    image:
                                        AssetImage('images/barcodeReader.png'),
                                  ),
                                  Text("Scan")
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    //

                    TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                          isDense: true,
                          hintText: barcode == '' ? "000 111 000" : "$barcode",
                          hintStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _description() {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _title("Description"),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: TextField(
                cursorColor: Colors.black,
                maxLines: 6,
                decoration: InputDecoration(
                    hintText: "Write Desription....",
                    hintStyle:
                        TextStyle(fontSize: 14, color: HexColor('#9E9E9E')),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            _title("Specification"),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: TextField(
                cursorColor: Colors.black,
                maxLines: 6,
                decoration: InputDecoration(
                    hintText: "Write Desription....",
                    hintStyle:
                        TextStyle(fontSize: 14, color: HexColor('#9E9E9E')),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
          ]),
    );
  }

  /////////////////////////////////////// METHODS /////////////////////////////////////////
  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
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
                Align(
                  alignment: Alignment.center,
                  child: Text("You have successfully added a product.",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 16, fontFamily: "CaviarDreams")),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
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
                      "Add More products",
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
  /////////////////////////////////////////////////////////////////////////////
}
