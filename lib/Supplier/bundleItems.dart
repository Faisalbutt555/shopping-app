import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transact/AppBar.dart';
import 'package:transact/Supplier/addProduct.dart';
import 'package:transact/utils/bottomButton.dart';
import 'package:transact/utils/dashedLine.dart';
import 'package:transact/utils/floatingButton.dart';
import 'package:transact/utils/routes.dart';

import 'package:transact/utils/utils.dart';

class BundleItems extends StatefulWidget {
  @override
  _BundleItemsState createState() => _BundleItemsState();
}

class _BundleItemsState extends State<BundleItems> {
  bool favorite = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      floatingActionButton: CustomFloatingButton(
        ontap: () {},
      ),
      backgroundColor: HexColor("#F5F7FA"),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: CustomeAppBar(
          title: "Bundle Items",
        ),
      ),
      body: _bundleItemBody(),
    ));
  }

  Widget _bundleItemCardSupplier() {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 4),
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          Container(
            //padding: EdgeInsets.symmetric(vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Image(
                  image: AssetImage("images/shirt.png"),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "V Neck Shirt - Black",
                        style: TextStyle(
                            color: HexColor("#3B444B"),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'CaviarDreams'),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Icon(
                          Icons.more_vert,
                          color: HexColor('#3B444B'),
                          size: 22,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Text(
                        "\$58.99",
                        style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: HexColor("#707070"),
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'CaviarDreams'),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "\$24.99",
                        style: TextStyle(
                            color: HexColor("#515C6F"),
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'CaviarDreams'),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Per Piece",
                        style: TextStyle(
                            color: HexColor("#707070"),
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'CaviarDreams'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              favorite == false
                                  ? favorite = true
                                  : favorite = false;
                            });
                          },
                          child: favorite == true
                              ? Icon(
                                  Icons.favorite_border,
                                  size: 20,
                                  color: Colors.grey,
                                )
                              : Icon(
                                  Icons.favorite,
                                  size: 20,
                                  color: Colors.red,
                                ))
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Min Order : (10)",
                    style: TextStyle(
                        color: HexColor("#707070"),
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'CaviarDreams'),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.star,
                          color: HexColor("#EFCE4A"),
                          size: 9,
                        ),
                        Icon(
                          Icons.star,
                          color: HexColor("#EFCE4A"),
                          size: 9,
                        ),
                        Icon(
                          Icons.star,
                          color: HexColor("#EFCE4A"),
                          size: 9,
                        ),
                        Icon(
                          Icons.star,
                          color: HexColor("#EFCE4A"),
                          size: 9,
                        ),
                        Icon(
                          Icons.star,
                          color: HexColor("#EFCE4A"),
                          size: 9,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          "(10)",
                          style: TextStyle(fontSize: 9),
                        ),
                      ],
                    ),
                    Text(
                      "(81/100) IN STOCK",
                      style: TextStyle(
                          color: HexColor("#707070"),
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'CaviarDreams'),
                    ),
                  ],
                )
              ],
            ),
          ),
          Align(
              alignment: Alignment.topRight,
              child: Container(
                  height: 20,
                  width: 35,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/discountTag.png"),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "-10%",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ))),
        ],
      ),
    );
  }

  Widget _bundleItemBody() {
    return Container(
        height: MediaQuery.of(context).size.height / 1.15,
        child: StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          itemCount: 8,
          itemBuilder: (BuildContext context, int index) => new Container(
              color: Colors.white,
              child: new Center(
                child: _bundleItemCardSupplier(),
              )),
          staggeredTileBuilder: (int index) =>
              new StaggeredTile.count(2, index.isEven ? 3 : 2.8),
          mainAxisSpacing: 7.0,
          crossAxisSpacing: 7.0,
        ));
  }
}

class AddBundle extends StatefulWidget {
  @override
  _AddBundleState createState() => _AddBundleState();
}

class _AddBundleState extends State<AddBundle> {
  var style = TextStyle(
      fontFamily: "CaviarDreams", fontSize: 16, fontWeight: FontWeight.bold);
  String _selectedCatagory;
  List<String> _catagory = [
    'Electronics',
    'Garments',
    'Cosmetics',
    'Accessories'
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: BottomButton(
        name: "Add Package",
        ontap: () {
          _showDialog();
        },
      ),
      backgroundColor: HexColor("#F5F7FA"),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: CustomeAppBar(
          title: "Add Packages",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _productDetail(),
            _plusProduct(),
            _productDetails(),
            _discountFields(),
          ],
        ),
      ),
    ));
  }

  Widget _productDetail() {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        color: Colors.white,
        padding: EdgeInsets.all(10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
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
              _textField()
            ]));
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

  Widget _textField() {
    return Container(
      height: 40,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      child: TextFormField(
          onFieldSubmitted: (String text) {
            print("$text");
          },
          decoration: InputDecoration(
            isDense: true,
            filled: true,
            fillColor: HexColor("#FFFFFF"),
            hintText: "Search Product",
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

  Widget _plusProduct() {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Container(
              margin: EdgeInsets.only(left: 40),
              child: Text("Add Product",
                  style: TextStyle(
                      fontFamily: "CaviarDreams",
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(right: 20, top: 8, bottom: 8),
              height: 40,
              width: 20,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all()),
              child: IconButton(
                onPressed: () {
                  AppRoutes.push(context, AddProduct());
                },
                icon: Icon(Icons.add),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _productDetails() {
    return Container(
        margin: EdgeInsets.all(10),
        color: Colors.white,
        padding: EdgeInsets.all(10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Order Detail",
                style: style.copyWith(color: HexColor("#6B6B6B")),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Wrap(
                      children: <Widget>[
                        Image(
                          height: MediaQuery.of(context).size.height * .09,
                          width: MediaQuery.of(context).size.width * .2,
                          image: AssetImage("images/iphone.png"),
                        ),
                        Center(
                          child: Text(
                            "iphone 8",
                            style: style.copyWith(color: HexColor("#6B6B6B")),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "\$968",
                    style: style,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Wrap(
                      children: <Widget>[
                        Image(
                          height: MediaQuery.of(context).size.height * .1,
                          width: MediaQuery.of(context).size.width * .2,
                          image: AssetImage("images/kurti.png"),
                        ),
                        Text(
                          "iphone 8",
                          style: style.copyWith(color: HexColor("#6B6B6B")),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "\$968",
                    style: style.copyWith(color: HexColor("#3B444B")),
                  ),
                ],
              ),
              MySeparator(),
              Container(
                alignment: Alignment.bottomRight,
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text("Total   \$924",
                    style: style.copyWith(color: HexColor("#3B444B"))),
              ),
            ]));
  }

  Widget _discountFields() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _title("Total Price"),
          Container(
            width: MediaQuery.of(context).size.width / 4,
            child: _textFormField("\$987"),
          ),
          _title("Discount"),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: _textFormField("In Percentage"),
                ),
                _title("OR"),
                SizedBox(width: 5,),
                Expanded(
                  child: _textFormField("in Cash"),
                ),
                SizedBox(
                  width: 6,
                ),
                Expanded(
                  child: _textFormField("After Discount"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _textFormField(String label) {
    return Container(
      child: TextFormField(
        decoration: InputDecoration(
            isDense: true,
            hintText: "$label",
            hintStyle: TextStyle(
              fontSize: 14,
              
            )),
      ),
    );
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
                  child: Text("You have successfully added a package.",
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
                      "Add More Packages",
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
}
